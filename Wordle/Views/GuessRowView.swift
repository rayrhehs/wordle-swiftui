//
//  GuessRowView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

struct GuessRowView: View {
    var guessData: GuessData
    
    private func getLetters(at index: Int) -> [String] {
        if (index < guessData.numberOfGuesses) {
            return guessData.pastGuesses[index]
        } else if (index == guessData.numberOfGuesses) {
            return guessData.userGuess
        } else {
            return []
        }
    }
    
    var body: some View {
        VStack {
            ForEach(0..<guessData.maxGuesses, id: \.self) { index in
                GuessRow(letters: getLetters(at: index))
            }
        }
        // ternary solution
//        ForEach(0..<guessData.maxGuesses, id: \.self) { index in
//            GuessRow(letters:
//                index < guessData.numberOfGuesses ? guessData.pastGuesses[index] :
//                index == guessData.numberOfGuesses ? guessData.userGuess :
//                []
//            )
//        }
    }
}

#Preview {
    GuessRowView(guessData: GuessData(userGuess: [], numberOfGuesses: 0))
}
