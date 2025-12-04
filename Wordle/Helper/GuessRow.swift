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
    
    private var getSquareColor: [Color] {
        // exits function if guard condition not met
        guard (rowStatus) else {
            return Array(repeating: Color.white, count: 5)
        }
        
        // creates an array of gray colors of size 5
        var colors: [Color] = Array(repeating: Color.gray, count: 5)
        var letterCount: [String: Int] = [:]
        
        // check if letter is in right spot and add to local letterCount dictionary variable
        for column in 0..<5 {
            
            let letter = guessLetters[column]
            
            if (letter == targetWordArray[column]) {
                colors[column] = Color.green
                letterCount[letter, default: 0] += 1
            }
        }
        
        // check if current letter count is < target letter count if and in the word
        for column in 0..<5 {
            if (colors[column] == Color.green) {
                continue // exit for loop
            }
            
            let letter = guessLetters[column]
            let currentCount = letterCount[letter, default: 0]
            let targetCount = targetWordLettersCount[letter, default: 0]
            
            if (currentCount < targetCount && targetWordArray.contains(letter)) {
                colors[column] = Color.yellow
                letterCount[letter, default: 0] += 1
            }
        }
            
        return colors
    }
    
    var body: some View {
        
        let squareColors = getSquareColor
        HStack {
            ForEach(0..<5, id: \.self) { column in
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 4)
                        .frame(width: 65, height: 65)
                        .background(squareColors[column])

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
        targetWordArray: ["E", "R", "A", "S", "E"],
        targetWordLettersCount: [
            "E": 2,
            "R": 1,
            "A": 1,
            "S": 1
        ],
        rowStatus: true
    )
}
