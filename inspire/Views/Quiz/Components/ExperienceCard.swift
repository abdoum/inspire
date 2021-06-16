//
//  ExperienceCard.swift
//  inspire
//
//  Created by ab on 11/06/2021.
//

import SwiftUI


struct CardView: View {
   var currentPage : Int
    let color : Color
    let maxX = UIScreen.main.bounds.maxX
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(self.color)
                    .shadow(color: self.color.opacity(1), radius: 10)
                    .background(Color.white)
                    .frame(width: 230, height: 250)
                Text("\(self.currentPage)")
                    .font(.system(size: 35))
                    .bold()
            }.rotation3DEffect(
                Angle(
                    degrees: Double((geometry.frame(in: .global).maxX - self.maxX) + self.maxX/2) / -5),
                axis: (x: 0, y: 1.0, z: 0)
            )
        }
    }
}

struct ExperienceCard: View {
    var colors = [Color.red.opacity(0.3),Color.yellow.opacity(0.3),
                   Color.green.opacity(0.3),Color.blue.opacity(0.3),
                   Color.purple.opacity(0.3),Color.red.opacity(0.3),
                   Color.yellow.opacity(0.3),Color.green.opacity(0.3),
                   Color.blue.opacity(0.3),Color.purple.opacity(0.3)]
    var body: some View {
        GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: geometry.size.width/2) {
                            ForEach(0..<self.colors.count, id: \.self) { index in
                                CardView(currentPage: index+1, color: self.colors[index])
                            }
                        }.padding(.horizontal,geometry.frame(in: .global).maxX/2)
                    }
                }
        Text("Image this as an experience card!")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.customPrimary)
    }
}

struct ExperienceCard_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceCard()
    }
}
