//
//  InterestsViewController.swift
//  Fanga Dagen
//
//  Created by Henrik Källenius on 26.11.20.
//

import UIKit

//This page serves only as a breif description of the app
class DescriptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        //when user presses button, go to Interests page
        self.performSegue(withIdentifier: "goToInterests", sender: self)
    }
    
}
