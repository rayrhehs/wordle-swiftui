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
                let fillColor = column < guessLetters.count ? letterColors[column] : Color.white
                ZStack {
                    Rectangle()
                        .fill(fillColor)
                        .frame(width: 65, height: 65)
                        .overlay(
                            Group {
                                if fillColor == Color.white {
                                    Rectangle()
                                        .stroke(Color.lightGray, lineWidth: 3)
                                } else {
                                    Rectangle()
                                        .stroke(fillColor, lineWidth: 3)
                                }
                            }
                        )
                    if column < guessLetters.count {
                        Text(guessLetters[column])
                            .foregroundStyle(fillColor == Color.white ? Color.black : Color.white)
                            .fontWeight(Font.Weight.heavy)
                            .font(.system(size: 30))
                            .bold()
                    }
                    
                }
                .frame(height: 65)
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
