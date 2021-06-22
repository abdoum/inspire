//
//  Step.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct Flow: View {
//     TODO: use @AppStorage for production
    //    @State private var currentStep : Int = 1
//            @AppStorage("currentStep") var currentStep = 1
    @AppStorage("totalSteps") var totalSteps = 4
    @State private var bgColors : [Color] = [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.4), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.7), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(1.0), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).opacity(0.9)]
    let slide : AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var sharedExperiences: SharedExperiences
    @EnvironmentObject var quiz : Quiz
    @State private var showQuiz : Bool = true
    
    var currentStep : Int {
        quiz.params.currentStep
    }
    var body: some View {
        VStack {
//            if quiz.params.currentStep <= totalSteps {
                ZStack {
                    if currentStep == 1 {
                        StepOne(bgColor: bgColors[currentStep - 1])
                            .transition(slide)
                    }
                    
                    if currentStep == 2 {
                        
                        StepTwo(bgColor: bgColors[currentStep - 1])
                            .transition(slide)
                    }
                    if currentStep == 3 {
                        StepThree(bgColor: bgColors[currentStep - 1])
                            .transition(slide)
                    }
                    if currentStep == 4 {
                        MasterView()
                            .transition(slide)
                    }
                    Spacer()
                }
                .overlay(
                    VStack {
                        if currentStep < totalSteps {
                            VStack {
                                Button(action: {
                                withAnimation(.spring()){
                                    
//                                    if currentStep == totalSteps {
//                                        presentationMode.wrappedValue.dismiss()
//                                    }
//                                    quiz.params.currentStep += 1
                                }
                            }, label: {
                                Text("\(currentStep)/\(totalSteps)")
                                    .font(.system(size:20, weight: .semibold))
                                    .foregroundColor(currentStep < totalSteps - 1 ? .black : .white)
                                    .frame(width: 60, height: 60)
                                    .background(currentStep < totalSteps - 1 ? Color.white : .green.opacity(0.4))
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
                            })
                                .padding([.trailing, .top], 35)
                        }
                            
                        } else {
                            EmptyView()
                        }
                    }
                    , alignment: .topTrailing
                )
                
//            }
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
    }
}
