//
//  OtherLoginButton.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct OtherLoginButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .underline()
                .foregroundColor(.black)
                .font(.headline)
        })
    }
}
