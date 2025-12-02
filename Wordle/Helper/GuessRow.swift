//
//  GuessRow.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-20.
//

import SwiftUI

struct GuessRow: View {
    var guessLetters: [String]
    var targetWordArray: [String]
    var rowStatus = false
    
    private func getBackgroundColor(for column: Int, guessLetters: [String], targetWordArray:[String], rowStatus: Bool) -> Color {
        guard column < guessLetters.count && column < targetWordArray.count && rowStatus else {
            return Color.clear
        }
        
        // if guessLetters[column] == targetWord[column] turn green
        if (targetWordArray[column] == guessLetters[column]) {
            return Color.green
        }
        
        // if targetWordArray contains guessLetters[column] then turn yellow
        if (targetWordArray.contains(guessLetters[column])) {
            return Color.yellow
        }
        
        return Color.gray
    }
    
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { column in
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 4)
                        .frame(width: 65, height: 65)
                        .background(getBackgroundColor(for: column, guessLetters: guessLetters, targetWordArray: targetWordArray, rowStatus: rowStatus))

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
    GuessRow(guessLetters: ["H", "E", "L", "L", "O"], targetWordArray: ["P", "E", "N", "N", "Y"], rowStatus: false)
}
