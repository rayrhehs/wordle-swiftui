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
    var targetWordLettersCount: [String: Int]
    var rowStatus = false
    
    private func getBackgroundColor(for column: Int, guessLetters: [String], targetWordArray:[String], rowStatus: Bool) -> Color {
        guard column < guessLetters.count && column < targetWordArray.count && rowStatus else {
            return Color.clear
        }
        
        // if guessLetters[column] == targetWord[column] turn green
        if (targetWordArray[column] == guessLetters[column]) {
            return Color.green
        }
        
        // if targetWordArray contains guessLetters[column] AND the correct number of letters then turn yellow
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
    GuessRow(guessLetters: ["E", "B", "E", "N", "E"], targetWordArray: ["P", "E", "N", "N", "Y"], targetWordLettersCount: [
        "P": 1,
        "E": 1,
        "N": 2,
        "Y": 1
    ], rowStatus: true)
}
