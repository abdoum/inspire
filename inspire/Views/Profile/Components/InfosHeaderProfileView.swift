//
//  InfosHeaderProfileView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct InfosHeaderProfileView: View {
    
    @EnvironmentObject var imageLoader: ImageLoader
    let imageName: String
    let fullName: String
    let job: String
    let isPro: Bool
    
    @State private var showCreatExperience: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                if isPro {
                    
                    
                    HStack(spacing: 20) {
                        ImageProfileView(imageName: imageName)
                            .padding(.leading)
                        VStack (alignment: .leading){
                            Text(fullName)
                                .font(.title)
                                .bold()
                            
                            Text(job)
                                .font(.subheadline)
                                .padding(.top, 1)
                            RatingLine(averageRating: 4.89, commentsCount: 328, color: .customPrimary)
                                .padding(.top, 10)
                        }
                    }
                    NavigationLink(destination: CreateExperience(showCreatExperience: $showCreatExperience)) {
                        Capsule()
                            .frame(height: 50)
                            .foregroundColor(Color.customPrimary)
                            .overlay(
                                Text("Créer une expérience")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            )
                            .padding([.leading,.trailing])
                    }
                    
                } else {
                    HStack {
                        ImageProfile(withURL: imageName)
                            .padding(.leading)
                        Spacer()
                        VStack (alignment: .leading){
                            Text(fullName)
                                .font(.title)
                                .bold()
                        }
                    }
                }
            }
        }
    }
}

struct InfosHeaderProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfosHeaderProfileView(imageName: "maria_lopez", fullName: "Maria Lopez", job: "Serveuse", isPro: true)
            //            InfosHeaderProfileView(imageName: "https://i.pravatar.cc/100?img=20", fullName: "Maria Lopez", job: "Serveuse", isPro: false).environmentObject(ImageLoader(urlString: ""))
        }
    }
}
