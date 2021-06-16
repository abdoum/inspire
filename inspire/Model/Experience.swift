//
//  Experience.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct Experience : Identifiable {
    let id : UUID = UUID()
    let author : User
    var duration : Double
    var price : Double
    var currency : String = "€"
    var category : [ExperienceCategory] = EXPERIENCE_CATEGORIES
    var participationMode : ParticipationMode = .visio
    var title : String
    var description : String
    var creationDate : Date = Date()
    var reviews : [Review] = []
    var isFavorite : Bool = false
}
