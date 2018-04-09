//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Katrin Obendrauf on 15/09/2017.
//  Copyright © 2017 Katrin Obendrauf. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionIndex = 0
    
    var questions: [Question] = [
        Question(text: "How tall are you?",
                 type: .single,
                 answers: [
                    Answer(text: "Tiny", type: .apollo),
                    Answer(text: "Average", type: .nova),
                    Answer(text: "Tall", type: .neither),
                    Answer(text: "Very tall", type: .neither)
            ]
        ), Question(text: "How many friends do you have?",
                    type: .ranged,
                    answers: [
                        Answer(text: "None", type: .neither),
                        Answer(text: "A few", type: .nova),
                        Answer(text: "Quite a lot", type: .neither),
                        Answer(text: "Many", type: .apollo),
            ]
        ), Question(text: "Which activities do you enjoy?",
                    type: .multiple,
                    answers: [
                        Answer(text: "Running", type: .apollo),
                        Answer(text: "Sleeping", type: .nova),
                        Answer(text: "Cuddling", type: .apollo),
                        Answer(text: "Climbing", type: .apollo)
            ]
        ), Question(text: "What's your favourite colour?",
                  type: .single,
                  answers: [
                    Answer(text: "White", type: .nova),
                    Answer(text: "Pink", type: .nova),
                    Answer(text: "Purple", type: .apollo),
                    Answer(text: "Blue", type: .neither)
            ]
        ), Question(text: "Which of these things scare you?",
                    type: .multiple,
                    answers: [
                        Answer(text: "Giving presentations", type: .nova),
                        Answer(text: "Being alone", type: .apollo),
                        Answer(text: "Heights", type: .neither),
                        Answer(text: "Spiders", type: .neither)
            ]
        ), Question(text: "How often do you like to run?",
                    type: .ranged,
                    answers: [
                        Answer(text: "Never", type: .neither),
                        Answer(text: "Sometimes", type: .nova),
                        Answer(text: "Often", type: .apollo),
                        Answer(text: "Every waking second", type: .neither)
            ]
        ), Question(text: "How much do you like to play?",
                    type: .ranged,
                    answers: [
                        Answer(text: "Not at all", type: .nova),
                        Answer(text: "A little", type: .nova),
                        Answer(text: "Quite a lot", type: .apollo),
                        Answer(text: "A lot", type: .apollo)
            ]
        ), Question(text: "Where would your prefered place to sleep be?",
                    type: .single,
                    answers: [
                        Answer(text: "Curled up in soft blankets", type: .apollo),
                        Answer(text: "Near a loved one", type: .apollo),
                        Answer(text: "On the top bunk of a bunk-bed", type: .nova),
                        Answer(text: "In a blanket fort", type: .nova)
            ]
        ), Question(text: "Which foods do you enjoy?",
                    type: .multiple,
                    answers: [
                        Answer(text: "Baby food", type: .nova),
                        Answer(text: "Milk", type: .apollo),
                        Answer(text: "Salad", type: .nova),
                        Answer(text: "Fish", type: .neither)
            ]
        )
    ]


    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedAnswerButton: UIButton!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let currentDefaultValue = currentQuestion.currentAnswer
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers, currentDefaultValue)
        case .multiple:
            updateMultipleStack(using: currentAnswers, currentDefaultValue)
        case .ranged:
            updateRangedStack(using: currentAnswers, currentDefaultValue)
                  }
    }
    
    func updateSingleStack(using answers: [Answer], _ defaultValue : [Float]?) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer], _ defaultValue : [Float]?) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = defaultValue![0] != 0
        multiSwitch2.isOn = defaultValue![1] != 0
        multiSwitch3.isOn = defaultValue![2] != 0
        multiSwitch4.isOn = defaultValue![3] != 0
        multiLabel1.text  = answers[0].text
        multiLabel2.text  = answers[1].text
        multiLabel3.text  = answers[2].text
        multiLabel4.text  = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer], _ defaultValue : [Float]?) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(defaultValue![0], animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        switch sender {
            case singleButton1:
                questions[questionIndex].setCurrentAnswer([0])
            // answersChosen.append(currentAnswers[0])
            case singleButton2:
                questions[questionIndex].setCurrentAnswer([1])
            case singleButton3:
                questions[questionIndex].setCurrentAnswer([2])
            case singleButton4:
                questions[questionIndex].setCurrentAnswer([3])
            default:
            break
        }
        for i in (questionIndex + 1) ..< questions.count {
            if questions[i].type == .single {
                updateSingleStack(using: questions[i].answers, questions[i].defaultAnswer())
                nextQuestion()
                break
            }
        }
        nextQuestion()
    }
        
    @IBAction func multipleAnswerButtonPressed(_ sender: UIButton) {
        var answer: [Float] = [0, 0, 0, 0]
        
        if multiSwitch1.isOn {
            answer[0] = 1
        }
        if multiSwitch2.isOn {
            answer[1] = 1
        }
        if multiSwitch3.isOn {
            answer[2] = 1
        }
        if multiSwitch4.isOn {
            answer[3] = 1
        }
        questions[questionIndex].setCurrentAnswer(answer)
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        questions[questionIndex].setCurrentAnswer([rangedSlider.value])
        //let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        //answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        questionIndex -= 1
        if questionIndex < 0 {
            performSegue(withIdentifier: "IntroductionSegue", sender: nil)
        } else {
            updateUI()
        }
    }
    
    func answersChosen() -> [Answer] {
        var result: [Answer] = []
        for question in questions {
            switch question.type {
            case .single:
                result.append(question.answers[Int(question.currentAnswer![0])])
            case .multiple:
                for i in 0 ..< question.currentAnswer!.count {
                    if question.currentAnswer![i] != 0 {
                        result.append(question.answers[i])
                    }
                }
            case .ranged:
                let index = Int(round(question.currentAnswer![0] * Float(question.answers.count - 1)))
                result.append(question.answers[index])
            }
        }
        return result
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen()
        }
    }
}
