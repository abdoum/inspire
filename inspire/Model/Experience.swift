//
//  Experience.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation
import CoreLocation

struct Experience : Identifiable {
    let id : UUID = UUID()
    let author : User
    var duration : Double
    // TODO: make function to calculate price based on pariticipation mode
    var price : Double
    var category : [ExperienceCategory] = EXPERIENCE_CATEGORIES
    var participationMode : ParticipationMode = .visio
    var title : String
    var description : String
    var guestPrerequisites : [String] = []
    var creationDate : Date = Date()
    var reviews : [Review] = []
    var averageRate : Double // TODO: calculate average rate from reviews.rate
    var isFavorite : Bool = false
    var location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436) // TODO: retreive coordinates using coreLocation
}
