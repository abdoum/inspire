//
//  PopupHomepage.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct PopupHomepage: View {
    
    @State var isFavorite: Bool = false
    let experienceCategory: ExperienceCategory
    func addFavorite(color: Color) -> some View {
        Button(action: {
            self.isFavorite.toggle()
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(color)
                
            }
        })
    }
    
    var body: some View {
        
        HStack {
            ZStack {
                Image("SculpteurSurPierre")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedCorners(tl: 20, tr: 0, bl: 20, br: 0))
                VStack{
                    HStack {
                        Spacer(minLength: 85)
                        addFavorite(color: .red)
                    }
                    .frame(width: 90, height: 50)
                    Spacer(minLength: 85)
                }
                .frame(width: 110, height: 120)
                
            }
            VStack {
                HStack(alignment: .center){
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                        .opacity(0.8)
                    
                    Text("4.7")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .opacity(0.8)
                    Text("(49)")
                        .foregroundColor(Color.gray)
                        .underline()
                    Spacer()
                    Text("Lyon")
                        .foregroundColor(Color.gray)
                    Image(systemName: "video")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15.0, height: 15.0)
                        .foregroundColor(.black)
                }
                .font(.subheadline)
                .frame(width: 200, height: 20)
                .padding()
                HStack {
                    Text("Sculpteur sur pierre")
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .opacity(0.8)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    
                }
                .padding(.bottom)
                .frame(width: 200, height: 20)
                
                Divider()
                    .padding(.vertical)
                    .frame(width: 220, height: 2)
                
                HStack(alignment: .top) {
                    Text("85€")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: "stopwatch")
                        .foregroundColor(.gray)
                        .opacity(1)
                    Text("4:00")
                        .foregroundColor(Color.gray)
                        .opacity(1)
                    
                }
                .padding(.bottom)
                .frame(width: 200, height: 30)
                .font(.body)
                .multilineTextAlignment(.leading)
                
                
            }
            .frame(width: 230, height: 50)
            
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct PopupHomepage_Previews: PreviewProvider {
    static var previews: some View {
        PopupHomepage(experienceCategory: experiencesCategories[0])
    }
}

