//
//  ExperienceLocationModes.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

enum LocationMode : String, CaseIterable {
    case france,
         worldwide,
         all
    
    static var allLocationModes: [String] {
        return LocationMode.allCases.map { $0.rawValue }
      }
}
