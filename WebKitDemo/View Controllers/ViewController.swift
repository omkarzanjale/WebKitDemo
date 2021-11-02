//
//  ViewController.swift
//  WebKitDemo
//
//  Created by Mac on 06/10/21.
//
/*
 Program - With the help of webkit search url on web and display it on webview
 */

import UIKit
import WebKit

class ViewController: UIViewController {
    //
    //MARK:Outlets
    //
    @IBOutlet weak var websiteView: WKWebView!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        websiteView.isHidden = true
    }
    
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
        websiteView.isHidden = false
        linkTextField.isHidden = true
        searchBtn.isHidden = true
        if let urlString = linkTextField.text,linkTextField.text?.isEmpty == false {
            if let url = URL(string: urlString){
                let request = URLRequest(url: url)
                websiteView.load(request)
            }else{
                websiteView.isHidden = true
                linkTextField.isHidden = false
                searchBtn.isHidden = false
                showAlert(title: "Warning", message: "Please enter valid URL!!!")
            }
        }else{
            websiteView.isHidden = true
            linkTextField.isHidden = false
            searchBtn.isHidden = false
            showAlert(title: "Warning", message: "Enter the link!!!")
        }
    }
}
