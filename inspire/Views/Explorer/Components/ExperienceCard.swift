//
//  ExperienceCard.swift
//  Inspire5
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI

struct ExperienceCard: View {
    
    @State var isFavorite: Bool = false
    let experienceCategory: ExperienceCategory
    
    func addFavorite(color: Color) -> some View {
        Button(action: {
            self.isFavorite.toggle()
        }, label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundColor(color)
        })
    }
    
    var body: some View {
            VStack {
                ZStack {
                    Image(experienceCategory.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 220)
                        .clipShape(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0))
                    VStack{
                        HStack {
                            Spacer()
                            addFavorite(color: .red)
                        }
                        .frame(width: 160, height: 50)
                        Spacer()
                    }
                    .frame(width: 160, height: 220)

                }

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
                    Text("Paris")
                        .foregroundColor(Color.gray)
                }
                .font(.subheadline)
                .frame(width: 160, height: 20)
                HStack {
                    Text(experienceCategory.name)
                                  .font(.title3)
                                  .foregroundColor(Color.black)
                                  .opacity(0.8)
                                  .multilineTextAlignment(.leading)
                              Spacer()

                          }
                          .padding([.top, .bottom, .trailing])
                          .frame(width: 160, height: 20)

                          Divider()
                              .frame(width: 180, height: 2)

                          HStack(alignment: .top) {
                              Text("13€")
                                  .fontWeight(.bold)
                                  .multilineTextAlignment(.leading)
                              Spacer()
                              Text("par personne")
                                  .foregroundColor(Color.gray)
                                  .opacity(0.8)
                          }
                          .frame(width: 160, height: 20)
                          .font(.body)
                          .multilineTextAlignment(.leading)
                          .padding(.bottom)

                      }
                      .overlay(RoundedRectangle(cornerRadius: 20)
                                  .stroke(Color.gray, lineWidth: 2))

                  }
       
}

struct ExperienceCard_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceCard(experienceCategory: experiencesCategories[0])
    }
}

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height

        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}
//struct ExperienceCard: View {
//    var body: some View {
//        VStack {
//            ZStack {
//                Image("Image1")
//                    .resizable()
//                    .scaledToFill()
//                Image(systemName: "heart.fill")
//                    .foregroundColor(Color.red)
//                    .frame(width: 300, height: 320, alignment: .topTrailing)
//            }
//            .clipped()
//
//            VStack(alignment: .leading) {
//                HStack(alignment: .center){
//
//                    Image(systemName: "star.fill")
//                    .foregroundColor(Color.black)
//                    Text("4,91")
//                    .font(.body)
//                    Text("(377)")
//                    .font(.caption)
//                    Text("•")
//                    Text("Localisation")
//                    .foregroundColor(Color.gray)
//                }
//                .padding(.bottom, -1.0)
//
//                VStack(alignment: .leading) {
//
//                    Text("Titre de l'expérience")
//                    .font(.title2)
//                    .multilineTextAlignment(.leading)
//
//                    Divider()
//
//                    HStack(alignment: .center){
//
//                        Spacer()
//
//                        Text("13€")
//                        .multilineTextAlignment(.leading)
//                    }
//                    .padding()
//                }
//
//            }
//            .padding()
//        }
//        .frame(width: 359, height: 550)
//        .clipShape(RoundedRectangle(cornerRadius: 16,style: .continuous))
//        .overlay(RoundedRectangle(cornerRadius: 16)
//                .stroke(Color.black, lineWidth: 2)
//                .opacity(0.3))
//
//    }
//}
