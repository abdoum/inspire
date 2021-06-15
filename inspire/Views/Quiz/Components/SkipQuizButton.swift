//
//  SkipQuizButton.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct SkipQuizButton: View {
    @EnvironmentObject var quiz : Quiz
    var body: some View {
        Button(action: {
            quiz.params.skipQuiz = true
        }, label: {
            Text("Décider plus tard")
                .fontWeight(.medium)
                .foregroundColor(.customSecondary)
                .underline()
        })
    }
}

struct SkipQuizButton_Previews: PreviewProvider {
    static var previews: some View {
        SkipQuizButton()
            .environmentObject(Quiz())

    }
}
