//
//  ViewController.swift
//  Xcode Cloud
//
//  Created by Foodstory on 27/4/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    var debouncerOfTextField: Debouncer!
    var debouncerOfButton: Debouncer!
    
    @IBOutlet weak var originalTxt: UITextField!
    @IBOutlet weak var debouncerTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init Debouncer
        debouncerOfButton = .init(interval: 0.5)
        debouncerOfTextField = .init(interval: 0.5)
        
        originalTxt.tag = 1
        originalTxt.delegate = self
        
        debouncerTxt.tag = 2
        debouncerTxt.delegate = self
    }

    @IBAction func originalAction(_ sender: Any) {
        print("Click Original btn")
    }
    
    
    @IBAction func debouncerAction(_ sender: Any) {
        debouncerOfButton.debounce {
            print("Click Debouncer btn")
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 1 {
            // original
            print("Text Original : \(textField.text ?? "")")
        }else{
            // debouncer
            debouncerOfTextField.debounce {
                print("Text Debouncer : \(textField.text ?? "")")
            }
        }
    }
}


