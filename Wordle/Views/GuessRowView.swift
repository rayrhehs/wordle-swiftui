//
//  GuessRowView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

struct GuessRowView: View {
    var guessData: GuessData

    private func getGuessLetters(at index: Int) -> [String] {
        if (index < guessData.numberOfGuesses) {
            return guessData.pastGuesses[index]
        } else if (index == guessData.numberOfGuesses) {
            return guessData.currentGuess
        } else {
            return []
        }
    }
    
    private func getLetterColors(at index: Int) -> [Color] {
        if index < guessData.pastGuessesColor.count {
            return guessData.pastGuessesColor[index]
        } else {
            return Array(repeating: Color.white, count: 5)
        }
    }
  
    var body: some View {
        VStack {
            ForEach(0..<guessData.maxGuesses, id: \.self) { index in
                GuessRow(guessLetters: getGuessLetters(at: index),
                         letterColors: getLetterColors(at: index)
                )
            }
        }
        .scenePadding(.top)
    }
}

#Preview {
    GuessRowView(guessData: GuessData())
}
