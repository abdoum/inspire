//
//  Title.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct PageTitle: View {
    let content : String
    var body: some View {
        Text(content)
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.customPrimary)
    }
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        PageTitle(content: "Main Page Title example")
            .previewLayout(.sizeThatFits)
    }
}
