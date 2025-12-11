//
//  GuessRow.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

struct GuessRow: View {
    var guessLetters: [String]
    var letterColors: [Color]
    
    var body: some View {

        HStack {
            ForEach(0..<5, id: \.self) { column in
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 4)
                        .frame(width: 65, height: 65)
                        .background(column < guessLetters.count
                                    ? letterColors[column] : Color.white
                        )

                    if column < guessLetters.count {
                        Text(guessLetters[column])
                    }
                    
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)   // center each row
    }
}

#Preview {
    GuessRow(
        guessLetters: ["T", "E", "P", "E", "E"],
        letterColors: [.green, .green, .darkGray, .yellow, .darkGray]
    )
}
