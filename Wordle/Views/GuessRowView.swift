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
        guessData.targetWordArray
    }
    var targetWordLettersCount: [String: Int] {
        guessData.targetWordLettersCount
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
                         targetWordLettersCount: targetWordLettersCount,
                         rowStatus: index < guessData.rowSubmission.count ? guessData.rowSubmission[index] : false)
            }
        }
    }
}

#Preview {
    GuessRowView(guessData: GuessData())
}
