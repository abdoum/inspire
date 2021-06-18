//
//  ExperienceContact.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 16/06/2021.
//

import SwiftUI

struct ExperienceContact: View {
    var body: some View {
        VStack {
            HStack {
                Image("manTalking")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30.0, height: 30.0)
                Text("Langue(s) : ")
                Text("Langue 1")
                //           Text(" & ")
                //          Text("Langue 2")
                Spacer()
            }
            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
            
            Divider()
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 165.0, height: 80.0)
                        .foregroundColor(.black)
                        .opacity(0.2)
                    VStack {
                        Button(action: {}) {
                            Image(systemName: "envelope")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 18.0, height: 18.0)
                                .foregroundColor(.black)
                        }
                        Spacer()
                            .frame(height: 10)
                        Text("Contacter")
                        Text(" FirstName  Name")
                    }
                }
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 165.0, height: 80.0)
                        .foregroundColor(.black)
                        .opacity(0.2)
                    VStack {
                        Button(action: {}) {
                            Image(systemName: "checkmark.shield")
                                .resizable()
                                .frame(width: 20.0, height: 20.0)
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.black)
                        }
                        Spacer()
                            .frame(height: 10)
                        Text("Confidentialité")
                        Text("  et Sécurité")
                    }
                    
                }
            }
            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
            
        }
        
        
        
        
        
        
    }
}

struct ExperienceContact_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceContact()
    }
}
