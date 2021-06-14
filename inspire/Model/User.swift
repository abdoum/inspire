//
//  User.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation
import CoreLocation

struct User: Identifiable {
    let id = UUID()
    var firstname : String
    var lastname : String
    var birthDate : Date = Date(timeIntervalSince1970: 0)
    var phone : String = ""
    var email : String = ""
    var biography : String = ""
    var spokenLanguages : [Locale] = [.current]
    var avatar : String = "https://via.placeholder.com/150/92c952"
//    var bookedSessions : [Session] = []
    var location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)
    var address : Address? = nil
    var isVerified : Bool = false
    var password : String? = nil
    var notificationsAccepted : Bool? = false
    var role : UserRole?
}
