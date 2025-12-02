//
//  ContentView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-12.
//

import SwiftUI

struct ContentView: View {
    @State private var guess = GuessData(currentGuess: [], numberOfGuesses: 0)
    
    var body: some View {
        GameView()
    }
}


#Preview {
    ContentView()
}
