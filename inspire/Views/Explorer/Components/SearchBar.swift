//
//  SearchBar.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Recherchez un lieu, un mot-clé...", text: $text)
                .textCase(.lowercase)
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    
                    Button(action: {
                        isEditing = false
                        text = ""
                        UIApplication.shared.endEditing()
                    }, label: {
//                        if !text.isEmpty() {
                        Image(systemName: isEditing ? "xmark.circle.fill" : "")
                                .foregroundColor(.customPrimary.opacity(0.9))
                                .font(.system(size: 20))
                                .padding(7)
//                        }
                    })
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                    
                    , alignment: .trailing
                )
        }
        .padding()
        .onTapGesture {
            isEditing = true
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("choco"), isEditing: .constant(true))
    }
}
