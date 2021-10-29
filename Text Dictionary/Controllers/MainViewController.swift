//
//  ViewController.swift
//  Text Dictionary
//
//  Created by Samyak Pawar on 29/10/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var fetchDictionaryScrollView: UIScrollView!
    @IBOutlet weak var inputTextView: UITextView!
    
    @IBOutlet weak var homeView: UIView!
    

    @IBOutlet weak var convertButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchNewDictionary()
        fetchDictionaryData()
        
        inputTextView.delegate = self
        inputTextView.text = "Enter Text"
        inputTextView.textColor = .lightGray
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            convertButtonBottomConstraint.constant = -keyboardHeight
        }
    }
    
    func fetchNewDictionary() {
        homeView.isHidden = true
        
        fetchDictionaryScrollView.isHidden = false
        fetchDictionaryScrollView.refreshControl = UIRefreshControl()

        fetchDictionaryScrollView.refreshControl?.addTarget(self, action: #selector(fetchDictionaryData), for: .valueChanged)

        fetchDictionaryScrollView.refreshControl?.beginRefreshing()
    }
    
    @objc func fetchDictionaryData() {
        //Fetch data from API.
        DispatchQueue.global().async {
            sleep(2)//artificial time to fetch data.

            DispatchQueue.main.async {
                self.fetchDictionaryScrollView.refreshControl?.endRefreshing()
                self.fetchDictionaryScrollView.isHidden = true
                self.homeView.isHidden = false
            }
        }
    }
    
    
    @IBAction func convertTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "to_result", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "to_result" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.inputText = inputTextView.text
        }
        
    }
    
}

