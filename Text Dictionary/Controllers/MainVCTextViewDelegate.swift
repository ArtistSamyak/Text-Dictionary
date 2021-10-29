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

    
}
