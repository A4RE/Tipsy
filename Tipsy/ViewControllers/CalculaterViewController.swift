//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculaterViewController: UIViewController {

    @IBOutlet weak var twentyPrcnBtn: UIButton!
    @IBOutlet weak var tenPrcnBtn: UIButton!
    @IBOutlet weak var zeroPrcnBtn: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip: Double = 0.10
    var numberOfPeople: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPrcnBtn.isSelected = false
        tenPrcnBtn.isSelected = false
        twentyPrcnBtn.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleDropPercent =  String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleDropPercent)!
        tip = buttonTitleAsNumber / 100
        
    }
    
    @IBAction func stepperChanging(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print(tip)
    }
    
}

