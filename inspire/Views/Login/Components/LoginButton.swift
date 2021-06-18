//
//  LoginButton.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct LoginButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action ,label: {
            ZStack {
                Capsule()
                    .frame(height: 50)
                    .foregroundColor(Color.customPrimary)
                Text(label)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
            }
            .padding(.trailing)
            .padding(.leading)
        })
    }
}
