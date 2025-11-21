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

struct KeyboardView: View {
    
    @Binding var guessData: GuessData
    
    var topRowArray = "QWERTYUIOP".map { String($0) }
    var middleRowArray = "ASDFGHJKL".map { String($0)}
    var bottomRowArray = "ZXCVBNM".map { String($0)}
    
    func addLetter(letter: String) {
        if (guessData.userGuess.count < guessData.maxGuessLetters) {
            guessData.userGuess.append(letter)
            print(guessData.userGuess)
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
        }
    }
}


struct KeyboardView_Previews: PreviewProvider {
    @State static var previewGuessData = GuessData(userGuess: [], guessNumber: 0)

    static var previews: some View {
        KeyboardView(guessData: $previewGuessData)
    }
}

