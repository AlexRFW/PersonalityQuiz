//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Alex Witkamp on 22-02-18.
//  Copyright © 2018 Alex Witkamp. All rights reserved.
//

import Foundation

// create a question struct
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

// types of questions
enum ResponseType {
    case single, multiple, ranged
}

// create an answer struct
struct Answer {
    var text: String
    var type: AnimalType
}

// types of animals with the result data
enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
            }
    }
}

// dictionary containing all the questions with answers created with structs above
var questions: [Question] = [
    
    Question(text: "Which food do you like the most?", type:.single, answers: [
        Answer(text: "Steak", type: .dog),
        Answer(text: "Fish", type: .cat),
        Answer(text: "Carrots", type: .rabbit),
        Answer(text: "Corn", type: .turtle)
        ]),

    Question(text: "Which activities do you enjoy?", type: .multiple, answers: [
        Answer(text: "Swimming", type: .turtle),
        Answer(text: "Sleeping", type: .cat),
        Answer(text: "Cuddling", type: .rabbit),
        Answer(text: "Eating", type: .dog)
        ]),
    
    Question(text: "How much do you enjoy car rides?", type: .ranged, answers: [
        Answer(text: "I dislike them", type: .cat),
        Answer(text: "I get a little nervous", type: .rabbit),
        Answer(text: "I barely notice them", type: .turtle),
        Answer(text: "I love them", type: .dog)
        ])
]

var questionIndex = 0




