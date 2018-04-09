//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Katrin Obendrauf on 15/09/2017.
//  Copyright © 2017 Katrin Obendrauf. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    var currentAnswer: [Float]?
    
    init(text: String, type: ResponseType, answers: [Answer]) {
        self.text       = text
        self.type       = type
        self.answers    = answers
        currentAnswer   = defaultAnswer()
        
    }
    
    func defaultAnswer () -> [Float]? {
        switch type {
        case .single:
            return nil
        case .multiple:
            return [0, 0, 0, 0]
        case .ranged:
            return [0.5]
        }
    }
    
    mutating func setCurrentAnswer(_ currentAnswer: [Float]?){
        self.currentAnswer = currentAnswer
    }

}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
    
}

enum AnimalType {
    case nova, apollo, neither
    
    var cat: Cat {
        switch self {
        case .nova:
            return Cat(name: "Nova", emoji: "🙀", description: "You are absolutely beautiful, but prefer to be alone. Others admire you, but you're too scared to let them into your heart. You are more intelligent than some may believe, and like to be in control of your situation.")
        case .apollo:
            return Cat(name: "Apollo", emoji: "😼", description: "You are mischevious and playful. Others love spending time with you but your silly antics can get annoying. You are ready to jump into any situation head first; your loving personality can always get you out trouble.")
        case .neither:
            return Cat(name: "neither", emoji: "😞", description: "You are neither of our beautiful boys! How disappointing.")
        }
    }
    
    
}
