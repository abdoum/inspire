//
//  Step.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct Flow: View {
//     TODO: use @AppStorage for production
    @AppStorage("currentStep") var currentStep = 1
    @AppStorage("isPresented") var isPresented = true
    @AppStorage("totalSteps") var totalSteps = 4
    let slide : AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    @EnvironmentObject var sharedExperiences: SharedExperiences
    @EnvironmentObject var quiz : Quiz

    var body: some View {
        VStack {
            if currentStep < totalSteps {
                ZStack {
                    if currentStep == 1 {
                        StepOne(currentStep: $currentStep)
                            .transition(slide)
                    }
                    
                    if currentStep == 2 {
                        
                        StepTwo( currentStep: $currentStep)
                            .transition(slide)
                    }
                    if currentStep == 3 {
                        StepThree(currentStep: $currentStep)
                            .transition(slide)
                    }
                    if currentStep == 4 {
                        ExplorerView()
                            .transition(slide)
                    }
                    Spacer()
                }
                .overlay(
                    VStack {
                        if currentStep < totalSteps {
                            VStack {
                                Text("\(currentStep)/\(totalSteps)")
                                    .font(.system(size:20, weight: .semibold))
                                    .foregroundColor(currentStep < totalSteps - 1 ? .black : .white)
                                    .frame(width: 60, height: 60)
                                    .background(currentStep < totalSteps - 1 ? Color.white : .green)
                                    .clipShape(Circle())
                                    .overlay(
                                        ZStack{
                                            Circle()
                                                .stroke(Color.black.opacity(0.1), lineWidth: 4)
                                            Circle()
                                                .trim(from: 0.0, to: CGFloat(currentStep) / CGFloat(totalSteps))
                                                .stroke(Color.green, lineWidth: 4)
                                                .rotationEffect(.init(degrees: -90))
                                        }
                                        .padding(-15)
                                    )
                                .padding([.trailing, .top], 35)
                        }
                            
                        }
                    }
                    , alignment: .topTrailing
                )
                
            }
        }
    }
}

struct QuizPageTitle: View {
    @EnvironmentObject var quiz : Quiz
    var body: some View {
        HStack {
            QuizTitle(content: quiz.params.steps[quiz.params.currentStep] ?? "")
                .padding()
                .frame(width: 220, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
                .frame( height: 180)
    }
}

struct Flow_Previews: PreviewProvider {
    static var previews: some View {
        Flow()
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
