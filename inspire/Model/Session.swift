//
//  ExperienceSession.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct Session {
    var date : Date
    var guests : [User] = []
    var maxGuests : Int
    var mode : ParticipationMode
    let experience : Experience
    var isFull : Bool = false
}
