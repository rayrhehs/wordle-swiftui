//
//  GameView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

extension Color {
    static let lightGray = Color(red: 0.7, green: 0.7, blue: 0.7, opacity: 1.0)
    static let darkGray = Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1.0)
}

struct GameView: View {
    @State private var guessData = GuessData()
    
    var body: some View {
        // Zstack - useful for overlaying
        // top most in VStack is the first to be rendered, everything else will render over it
        ZStack (alignment: .top) {
            VStack {
                GuessRowView(guessData: guessData)
                KeyboardView(guessData: $guessData)
            }
            if guessData.invalidGuess {
                Toast(message: guessData.invalidGuessMessage)
                    .padding(.top, 5)
                    .transition(.move(edge: .top).combined(with: .blurReplace))
                    .zIndex(1) // prevents the toast from getting behind components when exiting
            }
        }
        .animation(.easeInOut(duration: 0.3), value: guessData.invalidGuess)
    }
}

#Preview {
    GameView()
}
