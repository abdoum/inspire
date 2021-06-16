//
//  Step.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct Flow: View {
    @EnvironmentObject var quiz : Quiz
    
    var body: some View {
        let steps : [String] = quiz.params.steps.keys.map({String($0)})
        
        VStack {
            if !quiz.params.skipQuiz {
                
                VStack{
                    HStack {
                        QuizTitle(content: quiz.params.steps[quiz.params.currentStep] ?? "")
                            .padding()
                            .frame(width: 220, height: 200, alignment: .leading)
                        Spacer()
                        if quiz.params.currentStep < 4 {
                            QuizTitle(content: "\(quiz.params.currentStep)/\(steps.count - 1)")
                                .padding()
                        } else {
                            EmptyView()
                        }
                    }
                    .frame(width: 380, height: 180, alignment: .center)
                    
                    switch (quiz.params.currentStep) {
                    case 1:
                        StepOne()
                        Spacer()
                        HStack {
                            SkipQuizButton()
                                .padding()
                        }
                    case 2:
                        StepTwo()
                        
                    case 3:
                        StepThree()
                    case 4:
                        Suggestions()
                    default:
                        Home()
                    }
                    Spacer()
                }
                .background(Color(#colorLiteral(red: 0, green: 0.5882688165, blue: 0.5607096553, alpha: 1)))
                .edgesIgnoringSafeArea(.all)
            }else{
                Home()
            }
        }
    }
}

struct Step_Previews: PreviewProvider {
    static var previews: some View {
        Flow()
            .environmentObject(Quiz())
    }
}