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
    @State private var preriquisiteCount: Int = 1
    @State private var isVideo: Bool = false
    @State private var price: String = ""
    @Binding var showCreatExperience: Bool
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Catégorie")) {
                    Picker(selection: $experienceCategory, label: Text("Catégorie")) {
                        ForEach(experienceCategory) {
                            category in
                            Text(category.name)
                        }
                    }.pickerStyle(MenuPickerStyle())
    //                Spacer(minLength: 20)
                    HStack {
                        Toggle("Mode Video proposé", isOn: $isVideo)
                            .frame(width: 250, height: 20)
                        Spacer(minLength: 20)
                        Image(systemName: "video")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .opacity(0.7)
                    }
                    .frame(width: 300)
    //                CreateExpField(title: "Description", topic: $description)
    //                    .font(.title2)
    //                    .multilineTextAlignment(.leading)
                }
                Section(header: Text("Description")){
                        TextEditor(text: $description)
                            .frame(height: 200)
                }
                
                Section(header: Text("Tarif")){
                        TextField("Prix par personne", text: $price)
                            .keyboardType(.numberPad)
                }
                Section(header: Text("Pré-requis")){
                    Stepper(value: $preriquisiteCount, in: 1...3) {
                        Text("Ajouter un pré-requis")
                    }.disabled(preriquisiteCount < 1)
                    ForEach(1..<preriquisiteCount, id:\.self){idx in
                        TextField("pré-requis \(idx)", text: $preriquisite1)
                    }
                }
                
//                    HStack {
//                        Text("Price")
//                            .foregroundColor(.black)
//                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
//                            .frame(width: 120 , height: 15)
//                            .font(.title3)
//
//                        Spacer(minLength: 30)
//
//                        TextField(price, text: $price)
//                            .frame(width: 150 , height: 10).padding()
//                            .overlay(RoundedRectangle(cornerRadius: 20)
//                                        .stroke(Color.gray, lineWidth: 2))
//                            .font(.title3)
//                    }
//                    .padding(.vertical)
                    
//                    CreateExpField(title: "Prérequis 1", topic: $preriquisite1)
//                    CreateExpField(title: "Prérequis 2", topic: $preriquisite2)
//                    CreateExpField(title: "Prérequis 3", topic: $preriquisite3)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                        //code...
                    }) {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 200.0, height: 45.0)
                            .foregroundColor(.gray)
                            .padding()
                            .overlay(
                                Text("Valider")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white))
                    }
                        Spacer()
                    }
            }.navigationBarTitle ( Text ( "Créer une expérience" ))
        }
        
        
//            .listStyle(PlainListStyle())
    }
}


struct CreateExperience_Previews: PreviewProvider {
    static var previews: some View {
        CreateExperience(showCreatExperience: .constant(false))
    }
}
