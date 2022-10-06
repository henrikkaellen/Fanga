//
//  ChallengeViewController.swift
//  Fanga Dagen
//
//  Created by Henrik Källenius on 29.11.20.
//

import UIKit
import ConfettiView
import SCLAlertView

//array to append number of the day to an array that will be stored in UserDefaults
var DayCheck = [Int]()

class ChallengeViewController: UIViewController {
    
    var appBrain = AppBrain()
    
    //buttons of different days
    @IBOutlet weak var Day1: UIButton!
    @IBOutlet weak var Day2: UIButton!
    @IBOutlet weak var Day3: UIButton!
    @IBOutlet weak var Day4: UIButton!
    @IBOutlet weak var Day5: UIButton!
    @IBOutlet weak var Day6: UIButton!
    @IBOutlet weak var Day7: UIButton!
    @IBOutlet weak var Day8: UIButton!
    @IBOutlet weak var Day9: UIButton!
    @IBOutlet weak var Day10: UIButton!
    @IBOutlet weak var Day11: UIButton!
    @IBOutlet weak var Day12: UIButton!
    @IBOutlet weak var Day13: UIButton!
    @IBOutlet weak var Day14: UIButton!
    @IBOutlet weak var Day15: UIButton!
    @IBOutlet weak var Day16: UIButton!
    @IBOutlet weak var Day17: UIButton!
    @IBOutlet weak var Day18: UIButton!
    @IBOutlet weak var Day19: UIButton!
    @IBOutlet weak var Day20: UIButton!
    
    //for confetti animation from cocoapods
    @IBOutlet weak var confetti: ConfettiView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.confetti.stopAnimating()
        
        //functions to check if day has been completed
        appBrain.checkDay(Day: Day1, numb: 1)
        appBrain.checkDay(Day: Day2, numb: 2)
        appBrain.checkDay(Day: Day3, numb: 3)
        appBrain.checkDay(Day: Day4, numb: 4)
        appBrain.checkDay(Day: Day5, numb: 5)
        appBrain.checkDay(Day: Day6, numb: 6)
        appBrain.checkDay(Day: Day7, numb: 7)
        appBrain.checkDay(Day: Day8, numb: 8)
        appBrain.checkDay(Day: Day9, numb: 9)
        appBrain.checkDay(Day: Day10, numb: 10)
        appBrain.checkDay(Day: Day11, numb: 11)
        appBrain.checkDay(Day: Day12, numb: 12)
        appBrain.checkDay(Day: Day13, numb: 13)
        appBrain.checkDay(Day: Day14, numb: 14)
        appBrain.checkDay(Day: Day15, numb: 15)
        appBrain.checkDay(Day: Day16, numb: 16)
        appBrain.checkDay(Day: Day17, numb: 17)
        appBrain.checkDay(Day: Day18, numb: 18)
        appBrain.checkDay(Day: Day19, numb: 19)
        appBrain.checkDay(Day: Day20, numb: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //if user has no Interests saved, go to Interests page
        if defaults.object(forKey: "Interests") == nil {
            self.performSegue(withIdentifier: "Restart", sender: self)
        }
    }
    
    func createAlert(Day: UIButton, previousDay: UIButton, numb: Int) {
        //only if previous Day has been completed you should be able to complete the next day
        //numb == 1 is for the first day as it doesn't have a previous day
        if previousDay.isEnabled == false || numb == 1 {
            //array to store selected interests in UserDefaults
            let randomArray = defaults.array(forKey: "Interests")
            //pick a random interets from that array
            let randomInterest = randomArray!.randomElement() as! String
            //pick a random challenge from the dictionary of array in AppBrain()
            var randomElement = appBrain.categories[randomInterest]?.randomElement()
            //if those challenges are all already completed, choose a different category
            while randomElement == nil {
                randomElement = appBrain.categories[randomInterest]?.randomElement()
            }
            //show the index of that challenge
            var randomInt = appBrain.categories[randomInterest]?.firstIndex(of: randomElement!)
            while randomInt == nil {
                randomInt = appBrain.categories[randomInterest]?.firstIndex(of: randomElement!)
            }
            //alert that shows the Day, category and challenge
            let appearance = SCLAlertView.SCLAppearance(
                showCloseButton: false
            )
            let alert = SCLAlertView(appearance: appearance)
            alert.showInfo(randomInterest, subTitle: (appBrain.categories[randomInterest]?[randomInt!])!)
            
            
            //button in alert when completed
            let completed = alert.addButton("Completed"){
            //what will happen once user clicks completed on button
            //disbale or mark day as completed
            Day.isEnabled = false
            //append number to DayCheck array
            DayCheck.append(numb)
            //these next lines make sure that the number is stored in a Userdefault array; for first day you can store it directly in a UserDefault, but for the other days you have to get the value first and then set it again
            if numb == 1 {
            defaults.set(DayCheck, forKey: "DayNumber")
            }
            else {
            var DayHelp = defaults.array(forKey: "DayNumber")
            DayHelp?.append(numb)
            defaults.set(DayHelp, forKey: "DayNumber")
            }
            //remove challenge from array so that it doesn't appear again
                self.appBrain.categories[randomInterest]?.remove(at: randomInt!)
            //add confetti
            self.confetti.startAnimating()
            //delay by 3 seconds until ending confetti
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
               // stop confetti
                self.confetti.stopAnimating()
            }
        }
            alert.showSuccess(randomInterest, subTitle: (appBrain.categories[randomInterest]?[randomInt!])!)
        //present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - Show Challenge
    
    //these lines run the createAlert function mentioned above for each individual day
    
    @IBAction func day1ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day1, previousDay: Day1, numb: 1)
    }
    
    @IBAction func day2ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day2, previousDay: Day1, numb: 2)
    }
    
    @IBAction func day3ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day3, previousDay: Day2, numb: 3)
    }
    
    @IBAction func day4ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day4, previousDay: Day3, numb: 4)
    }
    
    @IBAction func day5ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day5, previousDay: Day4, numb: 5)
    }
    
    @IBAction func day6ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day6, previousDay: Day5, numb: 6)
    }
    
    @IBAction func day7ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day7, previousDay: Day6, numb: 7)
    }
    
    @IBAction func day8ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day8, previousDay: Day7, numb: 8)
    }
    
    @IBAction func day9ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day9, previousDay: Day8, numb: 9)
    }
    
    @IBAction func day10ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day10, previousDay: Day9, numb: 10)
    }
    
    @IBAction func day11ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day11, previousDay: Day10, numb: 11)
    }
    
    @IBAction func day12ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day12, previousDay: Day11, numb: 12)
    }
    
    @IBAction func day13ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day13, previousDay: Day12, numb: 13)
    }
    
    @IBAction func day14ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day14, previousDay: Day13, numb: 14)
    }
    
    @IBAction func day15ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day15, previousDay: Day14, numb: 15)
    }
    
    @IBAction func day16ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day16, previousDay: Day15, numb: 16)
    }
    
    @IBAction func day17ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day17, previousDay: Day16, numb: 17)
    }
    
    @IBAction func day18ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day18, previousDay: Day17, numb: 18)
    }
    
    @IBAction func day19ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day19, previousDay: Day18, numb: 19)
    }
    
    @IBAction func day20ButtonPressed(_ sender: UIButton) {
        createAlert(Day: Day20, previousDay: Day19, numb: 20)
    }
  
    //user can restart if they like
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Restart", message: "Are you sure you wish to restart?", preferredStyle: .alert)
        let restart = UIAlertAction(title: "Restart", style: .destructive) { [self] (action) in
        self.performSegue(withIdentifier: "Restart", sender: self)
        //reset UserDefaults fpr interests and Days completed
        defaults.removeObject(forKey: "Interests")
        defaults.removeObject(forKey: "DayNumber")
        }
        let goBack = UIAlertAction(title: "Cancel" , style: .default, handler: nil)
        
        alert.addAction(restart)
        
        alert.view.backgroundColor = .white
        
        alert.view.layer.cornerRadius = 12
        
        alert.addAction(goBack)
        present(alert, animated: true, completion: nil)
    }
}
