//
//  Toast.swift
//  Wordle
//
//  Created by Shehryar Manzar on 2025-12-05.
//

import SwiftUI

struct Toast: View {
    var message: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(message)
                .foregroundStyle(Color.white) // text color
                .font(.title3) // font size
                .fontWeight(.bold) // font weight
                .padding(15)
        }
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 10)) // swift dsn't hv border radius so they punish us w/ this workaround
        .shadow(radius: 2) // must be added after clipshape otherwise it will get cut by it
    }
}

#Preview {
    Toast(message: "Invalid Word")
}


