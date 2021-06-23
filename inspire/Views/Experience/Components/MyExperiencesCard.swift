//
//  MyExperiencesCard.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct MyExperiencesCard: View {
    
    @EnvironmentObject var favorisManager: FavorisManager
    let experienceCategory: Experience
    
    var body: some View {
        VStack {
            ZStack {
                Image(experienceCategory.category.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 120)
                    .clipShape(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0))
                VStack{
                    HStack {
                        Spacer(minLength: 90)
                        FavorisButton(experience: experienceCategory, isLike: favorisManager.isLike(experience: experienceCategory))
                    }
                    .frame(width: 110, height: 30)
                    Spacer()
                }
                .frame(width: 130, height: 110)
                
            }
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.black)
                    .opacity(0.8)
                
                Text(experienceCategory.rate)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.8)
                Spacer()
                Text("Lyon")
                    .foregroundColor(Color.gray)
            }
            .font(.caption)
            .frame(width: 120, height: 20)
            
            HStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(experienceCategory.category.name)
                            .foregroundColor(.black)
                            .font(.footnote)
                    }
                }
                Spacer()
            }
            .frame(width: 120, height: 30)
            Divider()
                .frame(width: 100, height: 2)
            
            HStack(alignment: .top) {
                Text("\(experienceCategory.price.description) €")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "video")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 15.0, height: 15.0)
                    .foregroundColor(.gray)
            }
            .frame(width: 100, height: 20)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .padding(.bottom, 7.0)
            
        }
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1))
        .padding(.leading, 10)
        .padding(.bottom, 2)
        
    }
    
}

struct MyExperiencesCard_Previews: PreviewProvider {
    static var previews: some View {
        MyExperiencesCard(experienceCategory: MOCK_EXPERIENCES[0]).environmentObject(FavorisManager())
    }
}
