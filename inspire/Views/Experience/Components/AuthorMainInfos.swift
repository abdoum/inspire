//
//  AuthorMainInfos.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct AuthorMainInfos: View {
    
    let imageName: String
    let fullName: String
    let specialisation: String
    let rate: String
    
    func button(imageName: String, action: Void) -> some View {
        Button(action: {
            action
        }) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 25.0, height: 25.0)
                .foregroundColor(.black)
                .opacity(0.8)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            //------------HEAD------------------
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80.0, height: 80.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(fullName)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    HStack {
                        Text(specialisation)
                        Spacer()
                    }.frame(width: 260)
                    .padding(.top)
                }.padding(.leading)
                Spacer()
            }
            //------------SUBHEAD---------------
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                        .opacity(0.8)
                    Text(" \(rate)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .opacity(0.8)
                    Button(action: {}) {
                        Text(" (Nb Avis)")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                            .underline()
                    }
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width)
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 150.0, height: 30.0)
                        .foregroundColor(.black)
                        .opacity(0.5)
                    Text("Category")
                        .foregroundColor(.white)
                }
                Spacer(minLength: 2)
                //Solo ---- Group ---- Visio
                HStack(alignment: .center) {
                    button(imageName: "person", action: ())
                    Spacer()
                    button(imageName: "person.3", action: ())
                    Spacer()
                    button(imageName: "video", action: ())
                }
                .padding([.horizontal, .trailing], 40)
                Spacer(minLength: 2)
                //--------RATE-------
                

                
            }.frame(height: 130)
            Divider()
            VStack {
                HStack {
                    Image(systemName: "map")
                        .foregroundColor(.black)
                        .opacity(0.5)
                    Text(" Town, Country")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                }
            }
            Divider()
        }
        .padding(.leading, 20)
    }
}

struct AuthorMainInfos_Previews: PreviewProvider {
    static var previews: some View {
        AuthorMainInfos(imageName: "profilepompier", fullName: "Test BLABLABLA", specialisation: "Test", rate: "0.0/5")
    }
}
