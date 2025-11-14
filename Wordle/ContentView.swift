//
//  ContentView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-12.
//

import SwiftUI

struct ContentView: View {
    @State private var guess = Guess()
    
    func updateAnswer(with letter: String) {
        if guess.guessedLetters.count < 5 {
            guess.guessedLetters.append(letter)
            print(guess.guessedLetters)
        }
    }
    
    // move them down the row
    // the foreach shit is throwing me off -
    func submitAnswer() {
        guess.guesses += 1
    }
    
    var body: some View {
        VStack {
                HStack {
                    ForEach(0..<5, id: \.self) { column in
                        ZStack {
                            Rectangle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 65, height: 65)
                            
                            if column < guess.guessedLetters.count {
                                Text(guess.guessedLetters[column])
                            }
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)   // center each row
            VStack {
                // make HStack for each keyRow
                HStack {
                    Button(action: {
                        if !guess.guessedLetters.isEmpty {
                            guess.guessedLetters.removeLast()
                            // call function to update square UI
                            print(guess.guessedLetters)
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
