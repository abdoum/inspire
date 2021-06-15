//
//  StepThree.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct StepThree: View {
    @EnvironmentObject var quiz : Quiz
    var body: some View {
        let choices = quiz.params.existingExperienceLocationModes
        
        VStack(spacing: 26) {
            ForEach(choices, id: \.self){mode in
                Button(action: {
                    quiz.params.preferedExperienceLocationMode = LocationMode(rawValue: mode) ?? .all
                    quiz.params.currentStep += 1
                }, label: {
                    Label(
                        title: {
                            if mode == "all" {
                                Text("Tous")
                            } else if mode == "country" {
                                Text("National")
                            }else if mode == "proximity"{
                                Text("A proximité")
                            }else if mode == "worldwide"{
                                Text("Monde entier")
                            }
                        },
                        icon: {
                            if quiz.params.preferedExperienceLocationMode.rawValue == mode {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 22))
                            } else {
                                Circle()
                                    .frame(width: 22, height: 22, alignment: .center)
                                    .foregroundColor(.customSecondaryLight)
                            }
                        }
                    )
                    .foregroundColor(quiz.params.preferedExperienceLocationMode.rawValue == mode ? Color.customPrimary : Color.customSecondary)
                    .frame(width: 335, height: 86, alignment: .center)
                    .border(quiz.params.preferedExperienceLocationMode.rawValue == mode ? Color.customPrimary : Color.customSecondaryLight, width: 2)
                    .background(quiz.params.preferedExperienceLocationMode.rawValue == mode ? Color.customSecondaryLight : Color.white)
                    .cornerRadius(14)
                })
            }
        }
    }
}

struct StepThree_Previews: PreviewProvider {
    static var previews: some View {
        StepThree()
            .environmentObject(Quiz())
    }
}
