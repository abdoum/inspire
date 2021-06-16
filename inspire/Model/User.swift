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
    let firstname: String
    let lastname: String
    let email: String
    var password : String
    var biography : String = ""
    var spokenLanguages : String = "francais"
    var avatar : String = "https://via.placeholder.com/150/92c952"
    var bookedSessions : [Session] = []
    var location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)
    var notificationsAccepted : Bool? = false
    var role : UserRole = UserRole.guest
}

extension User {
    init(user: SignUpUser) {
        self.firstname = user.firstname
        self.lastname = user.lastname
        self.email = user.email
        self.password = user.password
    }
}

struct SignUpUser {
    var firstname: String
    var lastname: String
    var email: String
    var password: String
    var confirmPassword: String
}
extension SignUpUser {
    static let empty: SignUpUser = SignUpUser(firstname: "", lastname: "", email: "", password: "", confirmPassword: "")
}
