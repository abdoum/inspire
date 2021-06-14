//
//  TitleView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct TitleView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "")
    }
}
