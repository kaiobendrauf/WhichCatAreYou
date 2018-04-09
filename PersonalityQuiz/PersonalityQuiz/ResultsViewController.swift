//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Katrin Obendrauf on 15/09/2017.
//  Copyright © 2017 Katrin Obendrauf. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]!

    @IBOutlet weak var resultEmojiLabel: UILabel!
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        calculatePersonalityResults ()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculatePersonalityResults () {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
    
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        resultEmojiLabel.text = String(mostCommonAnswer.cat.emoji)
        resultAnswerLabel.text = "You are \(mostCommonAnswer.cat.name)!"
        resultDefinitionLabel.text = mostCommonAnswer.cat.description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    */

}
