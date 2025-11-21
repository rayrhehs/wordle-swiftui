//
//  ContentView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-12.
//

import SwiftUI

struct ContentView: View {
    @State private var guess = GuessData()
    
    func updateAnswer(with letter: String) {
        if guess.userGuess.count < 5 {
            guess.userGuess.append(letter)
            print(guess.userGuess)
        }
    }
    
    func submitAnswer() {
        guess.guessNumber += 1
    }
    
    var body: some View {
        VStack {
            VStack {
                // make HStack for each keyRow
                HStack {
                    Button(action: {
                        if !guess.userGuess.isEmpty {
                            guess.userGuess.removeLast()
                            print(guess.userGuess)
                        }
                    }) {
                        Text("DELETE")
                            .frame(width: 80, height: 45)
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    .background(Color.blue)
                    
                    // submit button
                    Button(action: {
                        submitAnswer()
                    }) {
                        Text("SUBMIT")
                            .frame(width: 80, height: 45)
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    .background(Color.blue)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center) // centers the whole grid
        .padding()
    }
}


#Preview {
    ContentView()
}
