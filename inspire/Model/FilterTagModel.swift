//
//  FilterTag.swift
//  inspire
//
//  Created by dr on 21/06/2021.
//

import Foundation

struct FilterTagModel : Hashable {
    let id = UUID()
    var text : String
    var isSelected : Bool
}
