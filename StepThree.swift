//
//  StepThree.swift
//  inspire
//
//  Created by ab on 15/06/2021.
//

import SwiftUI

struct StepThree: View {
    @EnvironmentObject var quiz : Quiz
    var bgColor : Color
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        let choices = quiz.params.existingExperienceLocationModes
        
        VStack(spacing: 15) {
            QuizPageTitle()
            
            ForEach(choices, id: \.self){mode in
                Button(action: {
                    withAnimation(.spring()) {
                        presentationMode.wrappedValue.dismiss()
                        quiz.params.preferedExperienceLocationMode = LocationMode(rawValue: mode) ?? .all
                        quiz.params.currentStep += 1
                        
                    }
                    
                }, label: {
                    Label(
                        title: {
                            if mode == "all" {
                                Text("Les deux")
                            } else if mode == "france" {
                                Text("En france")
                            }else if mode == "proximity"{
                                Text("A proximité")
                            }else if mode == "worldwide"{
                                Text("Monde entier")
                            }
                        },
                        icon: {
                            if (quiz.params.preferedExperienceLocationMode != nil) && (quiz.params.preferedExperienceLocationMode!.rawValue == mode) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 22))
                            } else {
                                Circle()
                                    .frame(width: 22, height: 22)
                                    .foregroundColor(.customSecondaryLight)
                            }
                        }
                    )
                    .foregroundColor((quiz.params.preferedExperienceLocationMode != nil) && (quiz.params.preferedExperienceLocationMode!.rawValue == mode) ? Color.customPrimary : Color.customSecondary)
                    .overlay(
                    RoundedRectangle(cornerRadius: 14)
                    .stroke((quiz.params.preferedExperienceLocationMode != nil) && (quiz.params.preferedExperienceLocationMode!.rawValue == mode) ? Color.customPrimary : Color.customSecondaryLight, lineWidth: 2)
                        .frame(minWidth: 300, minHeight: 86)
                        )
                    .frame(minWidth: 300, minHeight: 86)
                    .background((quiz.params.preferedExperienceLocationMode != nil) && (quiz.params.preferedExperienceLocationMode!.rawValue == mode) ? Color.customSecondaryLight : Color.white)
                    .cornerRadius(14)
                })
            }
            Spacer()
        }.background(bgColor.ignoresSafeArea())
    }
}

struct StepThree_Previews: PreviewProvider {
    static var previews: some View {
        StepThree(bgColor: .red)
            .environmentObject(Quiz())
    }
}
