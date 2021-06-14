//
//  ParticipationMode.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

enum ParticipationMode: String, CaseIterable {
    case visio,
         face2face,
         all
    
    static var allParticipationModes: [String] {
        return ParticipationMode.allCases.map { $0.rawValue }
      }
}
