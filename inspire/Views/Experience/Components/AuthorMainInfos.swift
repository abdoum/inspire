//
//  AuthorMainInfos.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct AuthorMainInfos: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("SculpteurSurPierreHead")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80.0, height: 80.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                // .overlay(Circle().stroke(Color.red, lineWidth: 5))
                VStack(alignment: .leading) {
                    HStack {
                        Text("FirstName")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("Name")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        //                    Image(systemName: "checkmark.circle.fill")
                    }
                    Text("Specialisation")
                }
            }
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 150.0, height: 30.0)
                        .foregroundColor(.black)
                        .opacity(0.5)
                    
                    Text("Category")
                        .foregroundColor(.white)
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 150.0, height: 30.0)
                        .foregroundColor(.black)
                        .opacity(0.5)
                    HStack {
                        Image(systemName: "stopwatch")
                            .foregroundColor(.white)
                        //            .opacity(0.5)
                        Text("Duration")
                            .foregroundColor(.white)
                        
                    }
                }
                Spacer()
            }
            .padding()
            
            HStack {
                VStack {
                    Button(action: {}) {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25.0, height: 25.0)
                            .foregroundColor(.black)
                            .opacity(0.8)
                    }
                    
                }
                Spacer()
                VStack {
                    Button(action: {}) {
                        VStack {
                            Image(systemName: "person.3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20.0, height: 20.0)
                                .foregroundColor(.black)
                                .opacity(0.8)
                            Text("+5")
                                .foregroundColor(.black)
                                .opacity(0.8)
                        }
                    }
                    
                }
                Spacer()
                VStack {
                    
                    Button(action: {}) {
                        Image(systemName: "video")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25.0, height: 25.0)
                            .opacity(0.8)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal, 50.0)
            //      .padding(.vertical)
            
            
            
            Text("Expérience à découvrir")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.black)
                    .opacity(0.8)
                Text("Note")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.8)
                
                Button(action: {}) {
                    Text("(Nb Avis)")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                        .underline()
                }
                
                
                
            }
            
            
            Divider()
            
            ZStack {
                HStack {
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 150.0, height: 30.0)
                        .foregroundColor(.black)
                        .opacity(0.0) // rendre le bouton invisible
                    Spacer()
                }
                }
                HStack {
                    Image(systemName: "map")
                        .foregroundColor(.black)
                        .opacity(0.5)
                    
                    Text("Town, Country")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                
            }
        }
        .padding([.top, .leading, .bottom])
        
    }
}

struct AuthorMainInfos_Previews: PreviewProvider {
    static var previews: some View {
        AuthorMainInfos()
    }
}
