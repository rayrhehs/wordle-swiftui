//
//  KeyboardView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-14.
//

import SwiftUI

struct KeyLabel: View {
    let letter: String

    var body: some View {
        Text(letter)
            .frame(width: 30, height: 75)
            .foregroundStyle(Color.white)
            .background(Color.green)
            .cornerRadius(6)
            .bold()
    }
}

struct ButtonLabel: View {
    let buttonlabel: String
    
    var body: some View {
        Text(buttonlabel)
            .frame(width: 80, height: 45)
            .foregroundStyle(Color.white)
            .background(Color.blue)
            .cornerRadius(6)
            .bold()
    }
}

struct KeyboardView: View {
    
    @Binding var guessData: GuessData
    
    let delay = 3.0
    var topRowArray = "QWERTYUIOP".map { String($0) }
    var middleRowArray = "ASDFGHJKL".map { String($0)}
    var bottomRowArray = "ZXCVBNM".map { String($0)}
    
    func addLetter(letter: String) {
        if (guessData.currentGuess.count < guessData.maxGuessLetters) {
            guessData.currentGuess.append(letter)
            print(guessData.currentGuess)
        }
    }
    
    func removeLetter() {
        if !guessData.currentGuess.isEmpty {
            guessData.currentGuess.removeLast()
            print(guessData.currentGuess)
        }
    }
    
    func setInvalidGuess() {
        guard guessData.invalidGuess == false else {
            return
        }
        guessData.invalidGuess = true
        guessData.validateGuess() // determine what type of error it is

        // loop runs after delay (~3 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            guessData.invalidGuess = false
        }
    }
    
    func submitWord() {
        let mergedWord = guessData.currentGuess.joined()
        let isValidWord =
            guessData.allowedWordList.contains(mergedWord)
            || guessData.answerWordList.contains(mergedWord)
        // allowedList and answerList do not contain same words -> use both to check guessWord with isValidWord
        if guessData.currentGuess.count == 5 && isValidWord {
            guessData.pastGuesses.append(guessData.currentGuess)
            guessData.rowSubmission.append(true)
            guessData.currentGuess = [] // reset currentGuess so it starts fresh on next line
            guessData.numberOfGuesses += 1
            print("word submitted: \(mergedWord)")
            print("past guesses: \(guessData.pastGuesses)")
            print("actual word: \(guessData.targetWord)")
        } else {
            setInvalidGuess()
        }
    }
    
    var body: some View {
        VStack{
            HStack {
                ForEach(0..<topRowArray.count, id: \.self) { letterIndex in
                    Button(action: {
                        addLetter(letter: topRowArray[letterIndex])
                    }) {
                        KeyLabel(letter: topRowArray[letterIndex])
                    }
                }
            }
            HStack {
                ForEach(0..<middleRowArray.count, id: \.self) { letterIndex in
                    Button(action: {
                        addLetter(letter: middleRowArray[letterIndex])
                    }) {
                        KeyLabel(letter: middleRowArray[letterIndex])
                    }
                }
            }
            HStack {
                ForEach(0..<bottomRowArray.count, id: \.self) { letterIndex in
                    Button(action: {
                        addLetter(letter: bottomRowArray[letterIndex])
                    }) {
                        KeyLabel(letter: bottomRowArray[letterIndex])
                    }
                }
            }
            HStack{
                Button(action: {
                    submitWord()
                }) {
                    ButtonLabel(buttonlabel: "SUBMIT")
                }
                Button(action: {
                    removeLetter()
                }) {
                    ButtonLabel(buttonlabel: "DELETE")
                }
            }
            .padding(10)
        }
        .padding(10)
    }
}


#Preview {
    KeyboardView(guessData: .constant(GuessData()))
}
