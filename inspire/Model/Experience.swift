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
    var category : ExperienceCategory
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

var MOCK_EXPERIENCES : [Experience] = [
    Experience(author: MOCK_AUTHORS[3], duration: 60000, price: 70, category: EXPERIENCE_CATEGORIES[1], participationMode: .visio, title: "Chocolatier", description: "Fx unsp phalanx of l little finger, subs for fx w routn heal", guestPrerequisites: [""], creationDate: Date(), reviews: [MOCK_REVIEWS[3]], averageRate: 4, isFavorite: false, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: MOCK_AUTHORS[1], duration: 48000.70, price: 49.7, category: EXPERIENCE_CATEGORIES[1], participationMode: .all, title: "Clinical Specialist", description: "Laceration of body of pancreas, unsp degree, init encntr", guestPrerequisites: ["Secured non-volatile utilisation", "Monitored optimizing artificial intelligence", "Multi-tiered client-server throughput"], creationDate: ISO8601DateFormatter().date(from: "2020-09-03T08:37:19Z") ?? Date(), reviews: [MOCK_REVIEWS[1]], averageRate: 3.33, isFavorite: true),
    Experience(author: MOCK_AUTHORS[2], duration: 7900, price: 83, category: EXPERIENCE_CATEGORIES[0], participationMode: .visio, title: "Legal Assistant", description: "Corrosion involving larynx and trachea with lung, sequela", guestPrerequisites: ["Self-enabling needs-based moratorium", "Distributed impactful middleware", "Operative holistic process improvement"], creationDate: ISO8601DateFormatter().date(from: "2020-10-11T06:16:57Z") ?? Date(), reviews: [MOCK_REVIEWS[7]], averageRate: 1.25, isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: MOCK_AUTHORS[4], duration: 2800, price: 106, category: EXPERIENCE_CATEGORIES[1], participationMode: .visio, title: "Legal Assistant", description: "Arthropathy following intestinal bypass, right wrist", guestPrerequisites: ["Reduced executive adapter", "Networked 24 hour frame", "Decentralized uniform matrices"], creationDate: ISO8601DateFormatter().date(from: "2020-10-13T14:18:05Z") ?? Date(), reviews: [MOCK_REVIEWS[2]], averageRate: 4.42, isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: MOCK_AUTHORS[2], duration: 6900, price: 60, category: EXPERIENCE_CATEGORIES[1], participationMode: .solo, title: "Director of Sales", description: "Episcleritis", guestPrerequisites: ["Profit-focused leading edge monitoring", "Integrated foreground moratorium", "User-centric heuristic strategy"], creationDate: ISO8601DateFormatter().date(from: "2021-05-16T09:14:06Z") ?? Date(), reviews: [MOCK_REVIEWS[5]], averageRate: 3.14, isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: MOCK_AUTHORS[3], duration: 4400, price: 80, category: EXPERIENCE_CATEGORIES[1], participationMode: .visio, title: "Paralegal", description: "Fx unsp phalanx of l little finger, subs for fx w routn heal", guestPrerequisites: ["Synergistic encompassing secured line", "Team-oriented real-time challenge", "Distributed context-sensitive service-desk"], creationDate: ISO8601DateFormatter().date(from: "2020-09-29T18:47:42Z") ?? Date(), reviews: [MOCK_REVIEWS[0]], averageRate: 1.03, isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: MOCK_AUTHORS[3], duration: 91000, price: 106, category: EXPERIENCE_CATEGORIES[0], participationMode: .visio, title: "Analyst Programmer", description: "Nondisplaced transverse fracture of shaft of right tibia", guestPrerequisites: ["Quality-focused bandwidth-monitored protocol", "Horizontal heuristic encoding", "Visionary composite array"], creationDate: ISO8601DateFormatter().date(from: "2020-06-10T05:47:20Z") ?? Date(), reviews: [MOCK_REVIEWS[8]], averageRate: 3.48, isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: MOCK_AUTHORS[4], duration: 6800, price: 57, category: EXPERIENCE_CATEGORIES[0], participationMode: .all, title: "Web Developer I", description: "Pasngr in hv veh injured in clsn w oth and unsp mv in traf", guestPrerequisites: ["Polarised transitional core", "Future-proofed mission-critical support", "Open-source leading edge benchmark"], creationDate: ISO8601DateFormatter().date(from: "2020-08-27T02:20:23Z") ?? Date(), reviews: [MOCK_REVIEWS[0]], averageRate: 4.32, isFavorite: false, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: MOCK_AUTHORS[1], duration: 5900, price: 17, category: EXPERIENCE_CATEGORIES[1], participationMode: .all, title: "Legal Assistant", description: "Toxic effect of unspecified metal, undetermined, sequela", guestPrerequisites: ["Function-based analyzing software", "Balanced 6th generation migration", "Object-based mobile infrastructure"], creationDate: ISO8601DateFormatter().date(from: "2020-11-01T13:48:40Z") ?? Date(), reviews: [MOCK_REVIEWS[4]], averageRate: 1.47, isFavorite: false, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436))
]
