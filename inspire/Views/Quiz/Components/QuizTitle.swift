//
//  SwiftUIView.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct QuizTitle: View {
    let content : String
    var body: some View {
        Text(content)
            .font(.system(size: 34))
            .fontWeight(.heavy)
            .foregroundColor(.customPrimary)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct QuizTitleView_Previews: PreviewProvider {
    static var previews: some View {
        QuizTitle(content: "Quiz page title example")
    }
}
