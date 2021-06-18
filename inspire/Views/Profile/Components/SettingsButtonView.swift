//
//  SettingsButtonView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct SettingsButtonView: View {
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
