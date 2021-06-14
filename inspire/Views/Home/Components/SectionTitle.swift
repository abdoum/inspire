//
//  SectionTitle.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct SectionTitle: View {
    let content : String
    var body: some View {
        Text(content)
            .font(.system(size: 16))
            .fontWeight(.bold)
            .foregroundColor(.customPrimary)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(content: "Section title example")
            .previewLayout(.sizeThatFits)
    }
}
