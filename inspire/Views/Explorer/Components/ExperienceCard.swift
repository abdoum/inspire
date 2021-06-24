//
//  ExperienceCard.swift
//  Inspire5
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI

struct ExperienceCard: View {
    
    @State var isFavorite: Bool = false
    let experience: Experience
    let width = CGFloat(160)
    var body: some View {
        VStack {
            ZStack {
                Image(experience.category.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: 150)
                    .clipShape(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0))
                VStack{
                    Spacer()
                }
                .frame(width: width - 20, height: 150)
                
            }
            HStack(alignment: .center) {
                Image(systemName: "star.fill")
                    .foregroundColor(.black)
                    .opacity(0.8)
                Text("\(experience.rate)")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.8)
                Text("(\(experience.reviews.compactMap({$0.comment}).count))")
                    .foregroundColor(Color.gray)
                Spacer()
                Text("Paris")
                    .foregroundColor(Color.gray)
            }
            .font(.subheadline)
            .frame(width: width - 20, height: 20)
            HStack {
                Text(experience.category.specialisation)
                    .fontWeight(.thin)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .opacity(0.8)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding([.top, .bottom, .trailing])
            .frame(width: width - 20, height: 20)
            
            Divider()
                .frame(width: width)
            
            HStack(alignment: .top) {
//                PriceView(price: experience.price, color: .customPrimary)
                Button(action: {
                }) {
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.customSecondary)
                }
                Spacer()
                Link(destination: URL(string: "https://us04web.zoom.us/j/74207452617?pwd=RWkvellndjgwK20xSHZWWXYrRExyQT09#success")!, label: {
                    Image(systemName: "video")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.customSecondary)
                })
            }
            .frame(width: width - 40 , height: 220)
            
            .frame(width: width - 40, height: 20)
            .padding(.bottom)
        }
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.customSecondaryLight, lineWidth: 2))
    }
}

struct ExperienceCard_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceCard(experience: MOCK_EXPERIENCES[7])
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
