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



/* struct ExperienceCard: View {
 var experience : Experience
 var body: some View {
     VStack(alignment: .center) {
        
        ZStack {
         Image("experience.imageName")
             .resizable()
             .aspectRatio(contentMode: .fit)
             .clipped()
 
 if experince.isFavorite {
                 Image(systemName: "star.fill")
                     .foregroundColor(.red)                }
 
         VStack(alignment: .leading) {
             Text("experience.reviews")
                 .frame(maxWidth: .infinity, alignment: .leading)
                 .padding(1)
             Text("experience.title")
                 .padding(1)
                 .foregroundColor(.gray)
             Text("experience.price +  €")
                 .padding(1)
         }
         .padding(.horizontal, 20)

         Spacer()
     }
     .foregroundColor(.black)

     .padding(.bottom, 30)
 }
} */
/*
 struct ExperienceCard_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceCard(experience: <#Experience#>)
    }
}
 */
