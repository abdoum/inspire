//
//  CreateExperienceField.swift
//  inspire
//
//  Created by mac11 on 22/06/2021.
//

import SwiftUI

struct CreateExpField: View {
    
    var title: String
    @Binding var topic: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
                .frame(width: 120 , height: 15)
                .font(.title3)
            
            
            Spacer(minLength: 30)
            
            ScrollView {
                TextField(topic, text: $topic)
                    .frame(width: 150 , height: 50).padding()
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2))
            }
        }
        .frame(height: 100)
        .padding(.vertical)
        
    }
}

struct CreateExpField_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpField(title: "Catégorie", topic: .constant("Ingénieur"))
    }
}
