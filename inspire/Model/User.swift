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
    var avatar : String = "https://i.pravatar.cc/150"
    var bookedSessions : [Session] = [] // FIX: caused circular reference errors with MOCK_SESSIONS
    var location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)
    var notificationsAccepted : Bool? = false
    var role : UserRole = UserRole.guest
    var isLogged : Bool = false
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

class UserManager: ObservableObject {

    @Published var currentUser: User? = nil

    func login(email: String, password: String) -> Bool {
        let merge = UserManager.mockGuests + UserManager.mockAuthors
        guard let user = merge.first(where: { user in
            user.email == email && user.password == password
        }) else {
            return false
        }
        self.currentUser = user
        return true
    }
    
    func logout() {
        self.currentUser = nil
    }
    
    static let mockAuthors = [
        User(firstname: "Judicaël", lastname: "Jizhaki", email: "test1@test.com", password: "123456", biography: "Optimized modular interface", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=1", location: CLLocationCoordinate2D(latitude: 39.302809, longitude: 99.275837), notificationsAccepted: false, role: UserRole.author, isLogged: true),
        User(firstname: "Almérinda", lastname: "Armiger", email: "test2@test.com", password: "123456", biography: "Down-sized asymmetric budgetary management", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=1", location: CLLocationCoordinate2D(latitude: 18.740381, longitude: 109.735832), notificationsAccepted: true, role: UserRole.author, isLogged: true),
        User(firstname: "Lén", lastname: "Broadfield", email: "test3@test.com", password: "123456", biography: "Innovative value-added flexibility", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=68", location: CLLocationCoordinate2D(latitude: 13.6615154, longitude: 123.1900935), notificationsAccepted: false, role: .author, isLogged: false),
        User(firstname: "Néhémie", lastname: "Polleye", email: "test4@test.com", password: "123456", biography: "Synergistic tertiary focus group", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=49", location: CLLocationCoordinate2D(latitude: 41.0377245, longitude: 21.3300873), notificationsAccepted: true, role: .author, isLogged: false),
        User(firstname: "Miléna", lastname: "Deware", email: "test5@test.com", password: "123456", biography: "Decentralized fresh-thinking productivity", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=48", location: CLLocationCoordinate2D(latitude: 24.479833, longitude: 118.089425), notificationsAccepted: false, role: .author, isLogged: false),
        User(firstname: "Lóng", lastname: "Ventum", email: "test6@test.com", password: "123456", biography: "Programmable composite policy", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=52",location: CLLocationCoordinate2D(latitude: -23.216667, longitude: 46.6666669), notificationsAccepted: true, role: .author, isLogged: false),
        User(firstname: "Frédérique", lastname: "Huston", email: "test7@test.com", password: "123456", biography: "Mandatory even-keeled core", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=51", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true)
        
    ]

    static let mockGuests = [
        User(firstname: "Frédérique", lastname: "Filyukov", email: "efilyukov0@prlog.org", password: "LlUJTY3m91", biography: "Enhanced local framework", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=35",  bookedSessions: [MOCK_SESSIONS[0], MOCK_SESSIONS[1]], location: CLLocationCoordinate2D(latitude: 58.9015864, longitude: 5.7123282), notificationsAccepted: true, role: UserRole.guest, isLogged: true),
        User(firstname: "Maëly", lastname: "Watmough", email: "ewatmough2@hubpages.com", password: "8OZKa7FI3jHw", biography: "User-centric tertiary portal", spokenLanguages: "Francais", avatar: "https://i.pravatar.cc/100?img=38", bookedSessions: [MOCK_SESSIONS[2], MOCK_SESSIONS[3]], location: CLLocationCoordinate2D(latitude: -0.35294, longitude: -79.66033), notificationsAccepted: true, role: UserRole.guest, isLogged: true),
        User(firstname: "Adélaïde", lastname: "Behning", email: "cbehning4@bloglovin.com", password: "1VDsyRcqcV", biography: "De-engineered actuating concept", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=41", bookedSessions: [MOCK_SESSIONS[4], MOCK_SESSIONS[5], MOCK_SESSIONS[6], MOCK_SESSIONS[7], MOCK_SESSIONS[8]], location: CLLocationCoordinate2D(latitude: 40.645924, longitude: 115.540353), notificationsAccepted: false, role: UserRole.guest, isLogged: false),
        User(firstname: "Faîtes", lastname: "Doerrling", email: "edoerrling9@google.nl", password: "FZQhz3", biography: "Programmable multi-tasking strategy", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=28",location: CLLocationCoordinate2D(latitude: -8.2725, longitude: 123.3991), notificationsAccepted: false, role: .guest, isLogged: false),
        User(firstname: "Maïlis", lastname: "Leed", email: "gleeda@umich.edu", password: "p6jWaZO1K", biography: "Centralized clear-thinking system engine", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=28", location: CLLocationCoordinate2D(latitude: 47.6451517, longitude: 42.0889476), notificationsAccepted: true, role: .guest, isLogged: false),
        User(firstname: "Maïlis", lastname: "Negri", email: "bnegrib@i2i.jp", password: "fspAvReu6Ba", biography: "Self-enabling didactic website", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=29", location: CLLocationCoordinate2D(latitude: 48.7528373, longitude: 2.5304644), notificationsAccepted: true, role: .guest, isLogged: true),
        User(firstname: "Hélèna", lastname: "Buckam", email: "rbuckamc@yale.edu", password: "F0elyK", biography: "Object-based explicit encoding", spokenLanguages: "francais", avatar: "https://i.pravatar.cc/100?img=30", location: CLLocationCoordinate2D(latitude: 35.950418, longitude: 101.925248), notificationsAccepted: false, role: .guest, isLogged: true)
    ]
}

