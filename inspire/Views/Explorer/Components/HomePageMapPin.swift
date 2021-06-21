//
//  HomePageMapPin.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct HomePageMapPin: View {
    
    let experience: Experience
    
    var body: some View {
        VStack {
            Button(action: {
                //code...
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 70.0, height: 30.0)
                        .foregroundColor(.white)
                    
                    Text(experience.price.description)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .shadow(color: .gray, radius: 10)
        }
    }
}

struct HomePageMapPin_Previews: PreviewProvider {
    static var previews: some View {
        HomePageMapPin(experience: MOCK_EXPERIENCES[0])
    }
}
