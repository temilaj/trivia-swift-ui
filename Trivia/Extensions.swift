//
//  Extensions.swift
//  Trivia
//
//  Created by Temi Lajumoke on 12/24/21.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
