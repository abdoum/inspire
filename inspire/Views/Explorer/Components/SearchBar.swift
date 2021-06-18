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
            TextField("Choisissez un lieu, un mot-clé...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifiyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: .infinity, alignment: .leading)
                    }
                )
            
            Button(action: {
                isEditing = false
                text = ""
                UIApplication.shared.endEditing()
            }, label: {
                Text("Cancel")
                    .foregroundColor(.black)
            })
            .padding(.trailing, 8)
            .transition(.move(edge: .trailing))
            .animation(.default)
        }
        .onTapGesture {
             isEditing = true
        }
    }
}
