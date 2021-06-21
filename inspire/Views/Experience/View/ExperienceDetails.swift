//
//  ExperienceDetails.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceDetails: View {
    @State private var showMap : Bool = false
    @State var active = true
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Image("SculpteurSurPierre")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                    AuthorMainInfos()
                        .listRowInsets(EdgeInsets())
                    ExperienceContact()
                    ExperienceProgram("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut laborum", lineLimit: 6)
                    
                    UserNeeds()
                    
                    ExperienceReviews()
                }
                ExperiencePriceDates()
                
            }
            VStack {
                HStack {
                    NavigationLink(
                        destination: ExplorerView(showMap: $showMap, showQuiz: .constant(false)),
                        label: {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                            }.font(.system(size: 30))
                        })
                    //                    Button(action: {}) {
                    //                        ZStack {
                    //                            Image(systemName: "circle.fill")
                    //                                .foregroundColor(.black)
                    //                                .opacity(0.5)
                    //                            Image(systemName: "xmark.circle.fill")
                    //                                .foregroundColor(.white)
                    //                        }.font(.system(size: 30))
                    //                    }
                    //                    .padding()
                    
                    Spacer()
                    
                    Button(action: {}) {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Image(systemName: "paperplane.circle.fill")
                                .foregroundColor(.white)
                        }.font(.system(size: 30))
                    }
                    .padding()
                    
                    Button(action: {}) {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                                .opacity(0.8)
                                .font(.system(size: 18))
                        }
                    }
                    .padding()
                }
                .padding(.top,40)
                Spacer()
            }
        } .edgesIgnoringSafeArea(.all)
    }
    
}

struct ExperienceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetails()
    }
}
