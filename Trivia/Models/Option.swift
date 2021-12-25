//
//  Answer.swift
//  Trivia
//
//  Created by Temi Lajumoke on 12/24/21.
//

import Foundation

struct Option: Identifiable {
    var id = UUID() // Since API doesn't return unique IDs for each option
    var text: AttributedString
    var isAnswer: Bool
}
