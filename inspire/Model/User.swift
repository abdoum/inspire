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
    let birthDate: Date
    let phone: String
    let email: String
    var password : String
    var address : Address
    var biography : String = ""
    var spokenLanguages : [Locale] = [.current]
    var avatar : String = "https://via.placeholder.com/150/92c952"
    var bookedSessions : [Session] = []
    var location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)
    var isVerified : Bool = false
    var notificationsAccepted : Bool? = false
    var role : UserRole? = nil
}

extension User {
    init(user: SignUpUser) {
        self.firstname = user.firstname
        self.birthDate = user.userBirthDate
        self.address = user.userAddress
        self.lastname = user.lastname
        self.phone = user.phone
        self.email = user.email
        self.password = user.password
    }
}

struct SignUpUser {
    var firstname: String
    var lastname: String
    var birthDate: String
    var phone: String
    var email: String
    var password: String
    var address: String
    var city: String
    var zipCode: String
    var confirmPassword: String
}
extension SignUpUser {
    static let empty: SignUpUser = SignUpUser(firstname: "", lastname: "", birthDate: "", phone: "", email: "", password: "", address: "", city: "", zipCode: "", confirmPassword: "")
    var userAddress: Address {
        Address(street: self.address, city: self.city, zipCode: self.zipCode, state: nil, country: nil)
    }
    var userBirthDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.date(from: birthDate) ?? Date()
    }
}


