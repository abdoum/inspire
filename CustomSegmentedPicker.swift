//
//  CustomSegmentedPicker.swift
//  inspire
//
//  Created by dr on 22/06/2021.
//

import SwiftUI

struct CustomSegmentedPicker: View {

    @Binding var currentTab : Int
    @Namespace var animation
    
    var body: some View {
        HStack{
            Text("Liste")
                .fontWeight(.bold)
                .padding(.vertical, currentTab == 0 ? 6 :8)
                .padding(.horizontal, 14)
                .background(
                    ZStack{
                        if currentTab == 0 {
                            Color.white
                                .cornerRadius(19)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                )
                .foregroundColor(currentTab == 0 ? .customPrimary : .white)
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.6)){
                        currentTab = 0
                    }
                }
            Text("Carte")
                .fontWeight(.bold)
                .padding(.vertical, currentTab == 1 ? 6 :8)
                .padding(.horizontal, 14)
                .background(
                    ZStack{
                        if currentTab == 1 {
                            Color.white
                                .cornerRadius(19)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                )
                .foregroundColor(currentTab == 1 ? .customPrimary : .white)
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.6)){
                        currentTab = 1
                    }
                }
        }
        .padding(.horizontal,2)
        .background(Color.customPrimary)
        .cornerRadius(19)
    }
}

struct CustomSegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedPicker(currentTab: .constant(1))
    }
}
