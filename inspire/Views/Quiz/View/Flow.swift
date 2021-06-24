//
//  Step.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct Flow: View {
//     TODO: use @AppStorage for production
//    @AppStorage("quiz.params.currentStep") var currentStep = 1
//    @AppStorage("isPresented") var isPresented = true
    @AppStorage("totalSteps") var totalSteps = 4
    let slide : AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    @EnvironmentObject var sharedExperiences: SharedExperiences
    @EnvironmentObject var quiz : Quiz
    
    var body: some View {
        
        VStack {
            if quiz.params.currentStep < totalSteps {
                ZStack {
                    if quiz.params.currentStep == 1 {
                        StepOne(currentStep: $quiz.params.currentStep)
                            .transition(slide)
                    }
                    
                    if quiz.params.currentStep == 2 {
                        
                        StepTwo(currentStep: $quiz.params.currentStep)
                            .transition(slide)
                    }
                    if quiz.params.currentStep == 3 {
                        StepThree(currentStep: $quiz.params.currentStep)
                            .transition(slide)
                    }
                    if quiz.params.currentStep == 4 {
                        ExplorerView()
                            .transition(slide)
                    }
                    Spacer()
                }
                .overlay(
                    VStack {
                        if quiz.params.currentStep < totalSteps {
                            VStack {
                                Text("\(quiz.params.currentStep)/\(totalSteps)")
                                    .font(.system(size:20, weight: .semibold))
                                    .foregroundColor(quiz.params.currentStep < totalSteps - 1 ? .black : .white)
                                    .frame(width: 60, height: 60)
                                    .background(quiz.params.currentStep < totalSteps - 1 ? Color.white : .green)
                                    .clipShape(Circle())
                                    .overlay(
                                        ZStack{
                                            Circle()
                                                .stroke(Color.black.opacity(0.1), lineWidth: 4)
                                            Circle()
                                                .trim(from: 0.0, to: CGFloat(quiz.params.currentStep) / CGFloat(totalSteps))
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
