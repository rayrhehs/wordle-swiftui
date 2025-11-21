//
//  ContentView.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-12.
//

import SwiftUI

struct ContentView: View {
    @State private var guess = GuessData()
    
    var body: some View {
        GameView()
    }
}


#Preview {
    ContentView()
}
