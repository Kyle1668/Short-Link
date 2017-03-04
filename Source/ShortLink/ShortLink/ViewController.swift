//
//  ViewController.swift
//  ShortLink
//
//  Created by Kyle O'Brien on 3/4/17.
//  Copyright © 2017 Kyle O'Brien. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextViewDelegate {
    
    @IBOutlet weak var preText: UILabel!

    @IBOutlet weak var inputTextBox: UITextView!
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        preText.isHidden = true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        var isReturn: Bool = true
        
        if text == "\n" {
            inputTextBox.resignFirstResponder()
            isReturn = false
        }
        
        return isReturn
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            preText.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

