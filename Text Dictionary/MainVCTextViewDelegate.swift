//
//  MainVCTextViewDelegate.swift
//  Text Dictionary
//
//  Created by Samyak Pawar on 29/10/21.
//

import UIKit

extension MainViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = UIColor.black

    }

//    //To end editing when "Go" is pressed.
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if(text == "\n") {
//                    textView.resignFirstResponder()
//                    return false
//                }
//        return true
//    }
    
}
