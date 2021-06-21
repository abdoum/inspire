//
//  SegmentedControlView.swift
//  inspire
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI

struct SegmentedControlView: View {
    
    @Binding var selectorIndex: Int
    
    var body: some View {
        VStack {
            Picker("Views", selection: $selectorIndex) {
                Text("Liste").tag(0)
                Text("Carte").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
