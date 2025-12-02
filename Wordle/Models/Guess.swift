//
//  Guess.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-14.
//

import SwiftUI

struct GuessData {
    var targetWord = "HOUSE"
    var currentGuess:[String] = []
    var pastGuesses:[[String]] = []
    var maxGuessLetters = 5
    var maxGuesses = 6
    var numberOfGuesses = 0
    var rowSubmission: [Bool] = []
}
