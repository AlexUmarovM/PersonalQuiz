//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var rawTestResults:[Answer]!
    var testResults:[AnimalType]!
    var animalResult: AnimalType!
    @IBOutlet var mainResultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var results = [AnimalType.dog: 0,
                       AnimalType.cat: 0,
                       AnimalType.rabbit: 0,
                       AnimalType.turtle: 0]
        
        for answer in rawTestResults {
            results[answer.type]! += 1
        }
        
        let sortResults = results.sorted(by: {$0.value > $1.value})
        
        animalResult = sortResults.first!.key
        self.navigationItem.hidesBackButton = true
        
        mainResultLabel.text = "Вы - \(animalResult.rawValue)"
        resultDescriptionLabel.text = "\(animalResult.definition)"
    }
    
    
    
}
