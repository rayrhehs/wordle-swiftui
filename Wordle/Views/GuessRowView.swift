//
//  GuessRow.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

struct GuessRowView: View {
    var guessData: GuessData
    
    
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { column in
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 4)
                        .frame(width: 65, height: 65)

                    // remember, this runs for only the # of letters in guessedLetters
                    // = i should not check max here, elsewhere
                    if column < guessData.userGuess.count {
                        Text(guessData.userGuess[column])
                    }
                    
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)   // center each row
    }
}

#Preview {
    GuessRowView(guessData: GuessData(userGuess: [], guessNumber: 0))
}
