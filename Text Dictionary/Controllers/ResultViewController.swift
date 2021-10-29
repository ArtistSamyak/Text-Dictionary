//
//  ResultViewController.swift
//  Text Dictionary
//
//  Created by Samyak Pawar on 29/10/21.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    
    var inputText = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resultTextView.text = inputText
        
    }
    

    @IBAction func copyButton(_ sender: Any) {
        UIPasteboard.general.string = resultTextView.text
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
