//
//  SearchView.swift
//  Instagram_Clone
//
//  Created by Ryo on 16/06/2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchmode = false
    var body: some View {
        SearchBar(text: $searchText, isEditing: $inSearchmode)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
