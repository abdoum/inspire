//
//  DescriptionProfileView.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI

struct DescriptionProfileView: View {
    
    let descriptionProfile: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Qui je suis")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                Text(descriptionProfile)
            }
            .padding(.leading)
            Spacer()
        }
    }
}

struct DescriptionProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionProfileView(descriptionProfile: "Description du profile")
    }
}
