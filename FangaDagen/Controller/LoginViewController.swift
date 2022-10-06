//
//  ViewController.swift
//  Fanga Dagen
//
//  Created by Henrik Källenius on 25.11.20.
//

import UIKit
import CLTypingLabel

//Userdefaults for storing data when user terminates app
let defaults = UserDefaults.standard

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var quoteLabel: CLTypingLabel!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        quoteLabel.text = "Capture The Day..."
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //if user has already logged in, go directly to Challenge Page
        if defaults.object(forKey: "name") != nil {
            self.performSegue(withIdentifier: "loggedIn", sender: self)
        }
        
    }

    @IBAction func continuePressed(_ sender: UIButton) {
        //check if user has typed something in textfield
        if textFieldShouldEndEditing(nameTextField) == true
        {
            nameTextField.endEditing(true)
            
            //save name under forKey: "name"
            defaults.set(nameTextField.text, forKey: "name")
            
            //go to Description page
            self.performSegue(withIdentifier: "goToDescription", sender: self)
        }
        else{
            //if user hasn't typed in anything, indicate missing name by changing placeholder
            nameTextField.placeholder = "Enter your name"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if nameTextField.text != ""
        {
            return true
        }
        else
        {
            //if user hasn't typed in anything, indicate missing name by changing placeholder
            nameTextField.placeholder = "Enter your name"
            return false
        }
    }
}
