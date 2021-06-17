//
//  InfosHeaderGuestProfileView.swift
//  inspire
//
//  Created by Jonathan Duong on 16/06/2021.
//

import SwiftUI

struct InfosHeaderGuestProfileView: View {
    
    let imageName: String
    let fullName: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 110, height: 110)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.leading)
            Spacer()
            Text(fullName)
                .font(.title)
                .bold()
                .offset(x: -80)
        }
    }
}

struct InfosHeaderGuestProfileView_Previews: PreviewProvider {
    static var previews: some View {
        InfosHeaderGuestProfileView(imageName: "maria_lopez", fullName: "Maria Lopez")
    }
}
