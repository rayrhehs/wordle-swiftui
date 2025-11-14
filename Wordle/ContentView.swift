//
//  ContentView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-12.
//

import SwiftUI

struct ContentView: View {
    
    let keyRows = ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
    @State private var answer:[String] = []
    
    
    var body: some View {
        VStack {
            ForEach(0..<5) { row in
                HStack {
                    ForEach(0..<5) { column in
                        ZStack {
                            Rectangle()
                                .stroke(Color.black, lineWidth: 4)
                                .frame(width: 65, height: 65)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)   // center each row
            }
            VStack {
                // make HStack for each keyRow
                ForEach(0..<keyRows.count, id: \.self) { rowIndex in
                    let rowString = Array(keyRows[rowIndex])
                    HStack {
                        ForEach(0..<rowString.count, id: \.self) { letterIndex in
                            Button(action: {
                                if answer.count < 5 {
                                    answer.append(String(rowString[letterIndex]))
                                    print(answer)
                                }
                            }) {
                                Text(String(rowString[letterIndex]))
                                    .frame(width: 30, height: 75)
                                    .background(Color.green)
                                    .cornerRadius(6)
                            }
                        }
                    }
                }
                HStack {
                    Button(action: {
                        if !answer.isEmpty {
                            answer.removeLast()
                            print(answer)
                        }
                    }) {
                        Text("DELETE")
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)           // center the whole grid
        .padding()
    }
}


#Preview {
    ContentView()
}
