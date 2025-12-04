//
//  GameView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

struct GameView: View {
    @State private var guessData = GuessData()
    
    var body: some View {
        VStack {
            GuessRowView(guessData: guessData)
            KeyboardView(guessData: $guessData)
        }
    }
}

#Preview {
    GameView()
}
