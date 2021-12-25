//
//  APIResponse.swift
//  Trivia
//
//  Created by Temi Lajumoke on 12/24/21.
//

import Foundation

struct APIResponse: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        // Custom coding key, not included in the API response, so we need to set it inside the closure
        var formattedQuestion: AttributedString {
            do {
                // Formatting the question with AttributedString, because API might return some markdown text - which will be hard to read if we keep the string as is
                return try AttributedString(markdown: question)
            } catch {
                // If we run into an error, return an empty string
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var options: [Option] {
            do {
                // Formatting all answer strings into AttributedStrings and creating an instance of Answer for each
                let correct = [Option(text: try AttributedString(markdown: correctAnswer), isAnswer: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Option(text: try AttributedString(markdown: answer), isAnswer: false)
                }
                
                // Merging the correct and incorrect arrays together
                let allAnswers = correct + incorrects
                
                // Shuffling the answers so the correct answer isn't always the first answer of the array
                return allAnswers.shuffled()
            } catch {
                // If we run into an error, return an empty array
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}
