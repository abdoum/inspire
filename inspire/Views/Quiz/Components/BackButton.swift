//
//  BackButton.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct BackButton: View {
    @EnvironmentObject var quiz : Quiz
    var body: some View {
        if quiz.params.currentStep > 1 {
        Button(action: {
                quiz.params.currentStep -= 1
           
        }, label: {
            Image(systemName: "chevron.backward.circle")
                .font(.system(size: 32))
                .foregroundColor(.customPrimary)
        })
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
            .environmentObject(Quiz())
    }
}
