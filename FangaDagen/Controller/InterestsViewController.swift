//
//  InterestsViewController.swift
//  Fanga Dagen
//
//  Created by Henrik Källenius on 27.11.20.
//

import UIKit


class InterestsViewController: UIViewController {
    
    //struct from AppBrain.swift
    var appBrain = AppBrain()
    
    //buttons for different interests
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var languagesButton: UIButton!
    @IBOutlet weak var natureButton: UIButton!
    @IBOutlet weak var learningButton: UIButton!
    @IBOutlet weak var mindfulnessButton: UIButton!
    @IBOutlet weak var moviesButton: UIButton!
    @IBOutlet weak var literatureButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var adventurousButton: UIButton!
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var spontaneousButton: UIButton!
    @IBOutlet weak var ContinueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sportsButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: sportsButton, text: "Sports", numb: 0)
    }
    
    @IBAction func languagesButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: languagesButton, text: "Languages", numb: 1)
    }
    
    @IBAction func natureButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: natureButton, text: "Nature", numb: 2)
    }
    
    @IBAction func learningButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: learningButton, text: "Learning", numb: 3)
    }
    
    @IBAction func mindfulnessButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: mindfulnessButton, text: "Mindfulness", numb: 4)
    }
    
    @IBAction func moviesButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: moviesButton, text: "Movies", numb: 5)
    }
    
    @IBAction func literatureButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: literatureButton, text: "Literature", numb: 6)
    }
    
    @IBAction func foodButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: foodButton, text: "Food", numb: 7)
    }
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: randomButton, text: "Random", numb: 8)
    }
    
    @IBAction func adventurousButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: adventurousButton, text: "Adventurous", numb: 9)
    }
    
    @IBAction func activeButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: activeButton, text: "Active", numb: 10)
    }
    
    @IBAction func spontaneousButtonPressed(_ sender: UIButton) {
        appBrain.addInterest(Interest: spontaneousButton, text: "Spontaneous", numb: 11)
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        // check if at least 5 interests have been selected
        if appBrain.enoughInterests.filter({$0 == true}).count > 4 {
            //go to Challenges page
            self.performSegue(withIdentifier: "goToChallenges", sender: self)
            //store the selected Interests in UserDefaults
            defaults.set(appBrain.selectedCategories, forKey: "Interests")
        }
        else {
            //if the user hasn't selected enough interests, show a message indicating that
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
            label.center = CGPoint(x: 200, y: 650)
            label.text = "Choose at least five categories"
            label.textColor = .red
            self.view.addSubview(label)
        }
    }

}
