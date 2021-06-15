//
//  RandomCategory.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct RandomCategory: View {
    var body: some View {
        ZStack {
            // MARK: main shape
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(Color.black)
                .frame(width: 157, height: 140, alignment: .center)
            // MARK: card title
            VStack(alignment: .leading){
                Text("Surprends-moi !")
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .frame(width: 120, height: 50, alignment: .leading)
                    .foregroundColor(.customPrimary)
                // MARK: button
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 80, height: 26, alignment: .center)
                    .foregroundColor(.customPrimary)
                    .overlay(
                        // MARK: button text
                        Text("Voir")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
                
            }.alignmentGuide(HorizontalAlignment.leading) { _ in  80 }
        }
    }
}

struct RandomCategory_Previews: PreviewProvider {
    static var previews: some View {
        RandomCategory()
    }
}
