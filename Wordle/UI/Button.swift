//
//  SubmitButton.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-11-14.
//

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
