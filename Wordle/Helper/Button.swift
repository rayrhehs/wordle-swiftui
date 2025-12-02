//
//  SubmitButton.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-14.
//



// this will be used when i decide to modularize the buttons (towards the end)

import SwiftUI

struct SubmitButton: View {
    var body: some View {
        Button(action: {}) {
            Text("")
                .frame(width: 80, height: 45)
                .foregroundStyle(Color.white)
                .bold()
        }
        .background(Color.blue)
    }
}

#Preview {
    SubmitButton()
}
