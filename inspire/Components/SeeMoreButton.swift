//
//  SeeMoreButton.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct SeeMoreButton: View {
    var body: some View {
        Button(action: {}){
            Text("Voir tout")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .underline()
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
        }
    }
}


struct SeeMoreButton_Previews: PreviewProvider {
    static var previews: some View {
        SeeMoreButton()
    }
}
