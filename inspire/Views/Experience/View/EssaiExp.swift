//
//  EssaiExp.swift
//  inspire
//
//  Created by mac11 on 17/06/2021.
//

import SwiftUI

/*
struct Buttons: Hashable {
    var Crit: String
    var Selected: Bool = false
    var Colour: Color
}

var ButtonsData = [
    Buttons(Crit: "A", Selected: false, Colour: Color(.systemGray4)),
    Buttons(Crit: "B", Selected: false, Colour: Color(.systemGray4)),
    Buttons(Crit: "C", Selected: false, Colour: Color(.systemGray4)),
    Buttons(Crit: "D", Selected: false, Colour: Color(.systemGray4))
]



struct EssaiExp: View {

    @Binding var CritBoard: Bool
    @Binding var BackgroundColor: Color
    
    @State private var AllData = ButtonsData
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(Array(ButtonsData.enumerated()), id: \.element) { I, Data in
                        Button(action: {
                            self.AllData[I].Selected.toggle()
                            if self.AllData[I].Selected == true {
                                self.AllData[I].Colour = .green
                            } else {
                                self.AllData[I].Colour = Color(.systemGray4)
                            }
                        }) {
                            Text(Data.Crit)
                                .font(.system(size: 30))
                        }
                        .frame(width: 65, height: 55)
                        .background(self.AllData[I].Colour)
                        .cornerRadius(10)
                    }
                }
                .padding(.top, 50)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color(.white))
            .cornerRadius(25)
            
            Button(action: {
                self.CritBoard.toggle()
                self.BackgroundColor = .white
            }) {
                Image(systemName: "xmark").foregroundColor(.black)
            }.padding(25)
        }
    }
}


struct EssaiExp_Previews: PreviewProvider {
    static var previews: some View {
        EssaiExp(EssaiExp)
    }
}
 */
