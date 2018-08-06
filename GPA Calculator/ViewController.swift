//
//  ViewController.swift
//  GPA Calculator
//
//  Created by Jamie Johnston on 29/05/2018.
//  Copyright © 2018 Jamie Johnston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var totalCredits : Double = 0
    var gpaPoints : Double = 0
    var totalGpaPoints : Double = 0
    var numClasses : Int = 0
    var letterGrade : String = ""
    var GPA : Double = 0
    var cumulativeCredits : Double = 0
    
    //Input fields
    @IBOutlet var numberOfCredits: UITextField!
    @IBOutlet var gradeAchieved: UITextField!
    
    //Output Field
    @IBOutlet var gpaOutput: UILabel!
    @IBOutlet var errorMessage: UILabel!
    @IBOutlet var addedClass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addGrade(_ sender: Any) {
        let credits = Double(numberOfCredits.text!)
        let grade = Int(gradeAchieved.text!)
        
        if (grade! >= 70){
            letterGrade = "A"
            gpaPoints = 4.0
        } else if (grade! >= 60){
            letterGrade = "B+"
            gpaPoints = 3.3
        } else if (grade! >= 50){
            letterGrade = "B"
            gpaPoints = 3.0
        }  else if (grade! >= 40){
            letterGrade = "C+"
            gpaPoints = 2.3
        }  else if (grade! >= 38){
            letterGrade = "C"
            gpaPoints = 2.0
        }  else if (grade! <= 38){
            letterGrade = "F"
            gpaPoints = 0.0
        }
        
        totalCredits += credits!
        cumulativeCredits = credits! * gpaPoints
        totalGpaPoints += cumulativeCredits
        addedClass.text = "Credits: \(credits!), Grade \(grade!)"

    }
    
    @IBAction func calculateGPA(_ sender: Any) {
        
        GPA = totalGpaPoints / totalCredits
        let x = GPA
        let y = Double(round(1000*x)/1000)
        gpaOutput.text = "\(y)"
        
    }
    
    
    
    
}

