//
//  KeyboardView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-14.
//

import SwiftUI

struct KeyboardView: View {
    
    let keyRows = ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
    
    var topRowArray = "QWERTYUIOP".map { String($0) }
    var middleRowArray = "ASDFGHJKL".map { String($0)}
    var bottomRowArray = "ZXCVBNM".map { String($0)}
    
    var body: some View {
        Text("Hello")
//        ForEach(0..<keyRows.count, id: \.self) { rowIndex in
//            let rowString = Array(keyRows[rowIndex])
//            HStack {
//                ForEach(0..<rowString.count, id: \.self) { letterIndex in
//                    Button(action: {
//                        updateAnswer(with: String(rowString[letterIndex]))
//                    }) {
//                        Text(String(rowString[letterIndex]))
//                            .frame(width: 30, height: 75)
//                            .background(Color.green)
//                            .cornerRadius(6)
//                            .foregroundStyle(Color.white)
//
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    KeyboardView()
}
