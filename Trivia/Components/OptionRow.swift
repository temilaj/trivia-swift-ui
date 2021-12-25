//
//  AnswerRow.swift
//  Trivia
//
//  Created by Temi Lajumoke on 12/24/21.
//

import SwiftUI

struct OptionRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var option: Option
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(option.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: option.isAnswer ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(option.isAnswer ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? option.isAnswer ? green : red : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
               isSelected = true
               triviaManager.selectAnswer(option: option)
           }
        }
    }
}

struct OptionRow_Previews: PreviewProvider {
    static var previews: some View {
        OptionRow(option: Option(text: "Single", isAnswer: false))
            .environmentObject(TriviaManager())
    }
}
