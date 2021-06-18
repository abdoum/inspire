//
//  SectionTitle.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct SectionTitle: View {
    let content : String
    var body: some View {
        Text(content)
            .fontWeight(.bold)
            .foregroundColor(.customPrimary)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(content: "Section title")
    }
}
