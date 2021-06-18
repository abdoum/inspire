//
//  StepOne.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct StepTwo: View {
    @EnvironmentObject var quiz : Quiz
    var body: some View {
        let choices = quiz.params.existingExperienceParticipationModes
        
        VStack(spacing: 20) {
            ForEach(choices, id: \.self){mode in
                Button(action: {
                    quiz.params.preferedExperienceParticipationMode = ParticipationMode(rawValue: mode) ?? .all
                    quiz.params.currentStep += 1
                }, label: {
                    
                    Label(
                        title: {
                            switch (mode){
                            case "solo":
                                Text("En présenciel, seul")
                            case "visio":
                                Text("En ligne")
                            case "group":
                                Text("En présenciel, groupe")
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
                                    .frame(width: 22, height: 22, alignment: .center)
                                    .foregroundColor(.customSecondaryLight)
                            }
                        }
                    )
                    .foregroundColor((quiz.params.preferedExperienceParticipationMode != nil) && (quiz.params.preferedExperienceParticipationMode!.rawValue == mode) ? Color.customPrimary : Color.customSecondary)
                    .frame(width: 335, height: 86, alignment: .center)
                    .border((quiz.params.preferedExperienceParticipationMode != nil) && (quiz.params.preferedExperienceParticipationMode!.rawValue == mode) ?  Color.customPrimary : Color.customSecondary, width: 2)
                    .background((quiz.params.preferedExperienceParticipationMode != nil) && (quiz.params.preferedExperienceParticipationMode!.rawValue == mode) ? Color.customSecondaryLight : Color.white)
                    .cornerRadius(14)
                    
                })
            }
        }
    }
}

struct StepOne_Previews: PreviewProvider {
    static var previews: some View {
        StepTwo()
            .environmentObject(Quiz())
    }
}
