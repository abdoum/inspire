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
        HStack {
            CustomSegmentedPicker(currentTab: $selectorIndex)
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView(selectorIndex: .constant(1))
    }
}
