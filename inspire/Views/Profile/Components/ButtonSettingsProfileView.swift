//
//  ButtonSettingsProfileView.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI

struct ButtonSettingsProfileView: View {
    
    let imageName: String
    let label: String
    let editName: String
    let action: () -> Void
    
    var body: some View {
        Button (
            action: action
        , label: {
            ZStack {
                Capsule()
                    .frame(height: 50)
                    .foregroundColor(Color.customSecondary)
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.black)
                        .font(.title)
                    Text(label)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(editName)
                        .foregroundColor(.black)
                        .font(.subheadline)
                        .underline()
                }.padding([.leading, .trailing], 30)
            }
            .padding(.leading)
            .padding(.trailing)
        }

        )}
}

struct ButtonSettingsProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSettingsProfileView(imageName: "", label: "", editName: "", action: {})
    }
}
