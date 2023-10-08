//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Андрей Коваленко on 08.10.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var resultForPerson = "$0.0"
    var tip: Int?
    var numberOfPersons: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = resultForPerson
        settingsLabel.text = "Split between \(numberOfPersons ?? 0) persons, with \(tip ?? 10)% tip"

    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    


}
