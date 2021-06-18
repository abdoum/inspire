//
//  TitleScreen.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct TitleScreen: View {
    let content : String
    var body: some View {
        Text(content)
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.customPrimary)
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen(content: "Screen title")
    }
}
