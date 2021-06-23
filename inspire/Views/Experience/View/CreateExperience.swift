//
//  CreateExperience.swift
//  inspire
//
//  Created by mac11 on 22/06/2021.
//

import SwiftUI

struct CreateExperience: View {
    
    @State private var experienceCategory: [ExperienceCategory] = experiencesCategories
    @State private var description: String = ""
    @State private var preriquisite1: String = ""
    @State private var preriquisite2: String = ""
    @State private var preriquisite3: String = ""
    @State private var isVideo: Bool = false
    @State private var price: String = ""
    @Binding var showCreatExperience: Bool
    
    var body: some View {
        NavigationView {
            VStack {
//                HStack {
//                    Text("Créer une expérience")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        .fontWeight(.bold)
//                        .padding(.leading)
//                    Spacer()
//                }
                Spacer(minLength: 20)
                HStack {
                    Toggle("Mode Video proposé", isOn: $isVideo)
                        .frame(width: 250, height: 20)
                    Spacer(minLength: 20)
                    Image(systemName: "video")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25.0, height: 25.0)
                        .opacity(0.7)
                }
                .frame(width: 300)
                Spacer(minLength: 10)
                Picker(selection: $experienceCategory, label: Text("Catégorie")) {
                    ForEach(experienceCategory) {
                        category in
                        Text(category.name)
                    }
                }
                
                List {
                    CreateExpField(title: "Description", topic: $description)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Text("Price")
                            .foregroundColor(.gray)
                            .frame(width: 120 , height: 15)
                            .font(.title3)
                        
                        Spacer(minLength: 30)
                        
                        TextField(price, text: $price)
                            .frame(width: 150 , height: 10).padding()
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 2))
                            .font(.title3)
                    }
                    .padding(.vertical)
                    
                    CreateExpField(title: "Prérequis 1", topic: $preriquisite1)
                    CreateExpField(title: "Prérequis 2", topic: $preriquisite2)
                    CreateExpField(title: "Prérequis 3", topic: $preriquisite3)
                }
                Spacer(minLength: 20)
                
                Button(action: {
                    //code...
                }) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 200.0, height: 45.0)
                        .foregroundColor(.gray)
                        .padding()
                        .overlay(
                            Text("Validation")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white))
                }
            }
            .frame(width: 400)
            . navigationBarTitle ( Text ( "Créer une expérience" ).font(.title3))
        }
        
        
    }
}

struct CreateExperience_Previews: PreviewProvider {
    static var previews: some View {
        CreateExperience(showCreatExperience: .constant(false))
    }
}
