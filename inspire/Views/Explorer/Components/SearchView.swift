//
//  SearchView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText : String
    @Binding var inSearchmode : Bool
    var body: some View {
        SearchBar(text: $searchText, isEditing: $inSearchmode)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant("choco"), inSearchmode: .constant(false))
    }
}
