//
//  StepOne.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct StepTwo: View {
    @EnvironmentObject var quiz : Quiz
    var bgColor : Color
    var body: some View {
        let choices = quiz.params.existingExperienceParticipationModes
        VStack {
            QuizPageTitle()
            ForEach(choices, id: \.self){mode in
                Button(action: {
                    withAnimation(.spring()) {
                        quiz.params.preferedExperienceParticipationMode = ParticipationMode(rawValue: mode) ?? .all
                        quiz.params.currentStep += 1
                    }
                    
                }, label: {
                    Label(
                        title: {
                            switch (mode){
                            case "solo":
                                Text("En présenciel, seul")
                            case "visio":
                                Text("En ligne")
                            case "group":
                                Text("En présenciel, groupeEn présenciel, groupeEn présenciel, groupe")
                            default:
                                Text("Tous")
                            }
                        },
                        icon: {
                            if ((quiz.params.preferedExperienceParticipationMode != nil) && (quiz.params.preferedExperienceParticipationMode!.rawValue == mode)) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 22))
                            }else{
                                Circle()
                                    .frame(maxWidth: 22, maxHeight: 22)
                                    .foregroundColor(.customSecondaryLight)
                            }
                        }
                    )
                    .foregroundColor((quiz.params.preferedExperienceParticipationMode != nil) && (quiz.params.preferedExperienceParticipationMode!.rawValue == mode) ? Color.customPrimary : Color.customSecondary)
                    .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke((quiz.params.preferedExperienceParticipationMode != nil) && (quiz.params.preferedExperienceParticipationMode!.rawValue == mode) ?  Color.customPrimary : Color.customSecondary, lineWidth: 2)
                        .frame(minWidth: 300, minHeight: 86)
                    )
                    .frame(minWidth: 300, minHeight: 86)
                    .background((quiz.params.preferedExperienceParticipationMode != nil) && (quiz.params.preferedExperienceParticipationMode!.rawValue == mode) ? Color.customSecondaryLight : Color.white)
                    .cornerRadius(14)
                    
                })
            }
            Spacer()
        }.background(bgColor.ignoresSafeArea())
    }
}

struct StepOne_Previews: PreviewProvider {
    static var previews: some View {
        StepTwo(bgColor: .blue)
            .environmentObject(Quiz())
    }
}
