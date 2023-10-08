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
    @IBOutlet weak var calculateButton: UIButton!
    var tip: Double = 0.10
    var numberOfPeople: Int = 2
    var totalBill = 0.0
    var resultForPerson = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperChanging(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            totalBill = Double(bill)!
            let result = (totalBill + (totalBill * tip)) / Double(numberOfPeople)
            resultForPerson = "$\(result.twoDecimals())"
            self.performSegue(withIdentifier: "resultVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultVC" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultForPerson = resultForPerson
            destinationVC.tip = Int(tip * 100)
            destinationVC.numberOfPersons = numberOfPeople
        }
    }
}

extension Double {
    func twoDecimals() -> String {
        return String(format: "%.2f", self)
    }
}
