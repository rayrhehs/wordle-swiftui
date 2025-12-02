//
//  GuessRowView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

struct GuessRowView: View {
    var guessData: GuessData
    var targetWordArray: [String] {
        guessData.targetWord.map { String($0) }
    }
    
    private func getGuessLetters(at index: Int) -> [String] {
        if (index < guessData.numberOfGuesses) {
            return guessData.pastGuesses[index]
        } else if (index == guessData.numberOfGuesses) {
            return guessData.currentGuess
        } else {
            return []
        }
    }
    
    private func getRowStatus(at index: Int) -> Bool {
        if (index < guessData.rowSubmission.count) {
            return guessData.rowSubmission[index]
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack {
            ForEach(0..<guessData.maxGuesses, id: \.self) { index in
                GuessRow(guessLetters: getGuessLetters(at: index),
                         targetWordArray: targetWordArray,
                         rowStatus: index < guessData.rowSubmission.count ? guessData.rowSubmission[index] : false)
            }
        }
        // ternary solution
//        ForEach(0..<guessData.maxGuesses, id: \.self) { index in
//            GuessRow(letters:
//                index < guessData.numberOfGuesses ? guessData.pastGuesses[index] :
//                index == guessData.numberOfGuesses ? guessData.currentGuess :
//                []
//            )
//        }
    }
}

#Preview {
    GuessRowView(guessData: GuessData(currentGuess: [], numberOfGuesses: 0))
}
