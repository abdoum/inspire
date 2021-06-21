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
    var averageRate : Double {
        Double(reviews.compactMap({$0.rate}).reduce(0, +) / reviews.count)
    }
    var isFavorite : Bool = false
    var location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436) // TODO: retreive coordinates using coreLocation
}

class SharedExperiences: ObservableObject {
    @Published var experiences = MOCK_EXPERIENCES
//    @Published var filteredExperiences : [Experience] = []
    
    func search(searchText: String) -> [Experience] {
        let selectedTags = ExperienceCategory(name: "any", image: "boulanger").selectedTags.map({$0.text})
        let searchText = searchText.trimmingCharacters(in: .whitespaces)
        var results : [Optional<Experience>] = experiences.filter(
            { searchText.isEmpty ? true :
                $0.title.contains(searchText)
                || $0.description.contains(searchText)
                || $0.category.name.contains(searchText)
                || $0.category.specialisations.contains(searchText)
                
            })
        
        if !selectedTags.isEmpty {
            for tag in selectedTags{
         let tagSearchResults : [Experience] = experiences.filter(
                {
                    $0.title.contains(tag)
                    || $0.description.contains(tag)
                    || $0.category.name.contains(tag)
                    || $0.category.specialisations.contains(tag)
                })
                    results += tagSearchResults
//                filteredExperiences = results.compactMap({$0})
            }
        }
       
        if  (!results.isEmpty) {
//            filteredExperiences = results.compactMap({$0})
            return results.compactMap({$0})
        }else{
//            filteredExperiences = []
            return []
        }
    }
}

var MOCK_EXPERIENCES : [Experience] = [
    Experience(author: UserManager.mockAuthors[3], duration: 6000, price: 70, category: experiencesCategories[5], participationMode: .visio, title: "Chocolatier", description: "Fx unsp phalanx of l little finger, subs for fx w routn heal", guestPrerequisites: [""], creationDate: Date(), reviews: [MOCK_REVIEWS[3]], isFavorite: false, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),    Experience(author: UserManager.mockAuthors[1], duration: 4800.70, price: 49.7, category: experiencesCategories[1], participationMode: .all, title: "Clinical Specialist", description: "Laceration of body of pancreas, unsp degree, init encntr", guestPrerequisites: ["Secured non-volatile utilisation", "Monitored optimizing artificial intelligence", "Multi-tiered client-server throughput"], creationDate: ISO8601DateFormatter().date(from: "2020-09-03T08:37:19Z") ?? Date(), reviews: [MOCK_REVIEWS[1]],  isFavorite: true),
    Experience(author: UserManager.mockAuthors[2], duration: 7900, price: 83, category: experiencesCategories[0], participationMode: .visio, title: "Juriste", description: "Corrosion involving larynx and trachea with lung, sequela", guestPrerequisites: ["Self-enabling needs-based moratorium", "Distributed impactful middleware", "Operative holistic process improvement"], creationDate: ISO8601DateFormatter().date(from: "2020-10-11T06:16:57Z") ?? Date(), reviews: [MOCK_REVIEWS[7]],  isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: UserManager.mockAuthors[4], duration: 2800, price: 106, category: experiencesCategories[2], participationMode: .visio, title: "Legal Assistant", description: "Arthropathy following intestinal bypass, right wrist", guestPrerequisites: ["Reduced executive adapter", "Networked 24 hour frame", "Decentralized uniform matrices"], creationDate: ISO8601DateFormatter().date(from: "2020-10-13T14:18:05Z") ?? Date(), reviews: [MOCK_REVIEWS[2]],  isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: UserManager.mockAuthors[2], duration: 6900, price: 60, category: experiencesCategories[1], participationMode: .solo, title: "Directeur commercial", description: "Episcleritis", guestPrerequisites: ["Profit-focused leading edge monitoring", "Integrated foreground moratorium", "User-centric heuristic strategy"], creationDate: ISO8601DateFormatter().date(from: "2021-05-16T09:14:06Z") ?? Date(), reviews: [MOCK_REVIEWS[5]], isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: UserManager.mockAuthors[3], duration: 4400, price: 80, category: experiencesCategories[4], participationMode: .visio, title: "Avocat", description: "Fx unsp phalanx of l little finger, subs for fx w routn heal", guestPrerequisites: ["Synergistic encompassing secured line", "Team-oriented real-time challenge", "Distributed context-sensitive service-desk"], creationDate: ISO8601DateFormatter().date(from: "2020-09-29T18:47:42Z") ?? Date(), reviews: [MOCK_REVIEWS[0]],  isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: UserManager.mockAuthors[3], duration: 91000, price: 106, category: experiencesCategories[5], participationMode: .visio, title: "Développeur", description: "Nondisplaced transverse fracture of shaft of right tibia", guestPrerequisites: ["Quality-focused bandwidth-monitored protocol", "Horizontal heuristic encoding", "Visionary composite array"], creationDate: ISO8601DateFormatter().date(from: "2020-06-10T05:47:20Z") ?? Date(), reviews: [MOCK_REVIEWS[8]],  isFavorite: true, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: UserManager.mockAuthors[4], duration: 6800, price: 57, category: experiencesCategories[3], participationMode: .all, title: "Developeur web", description: "Pasngr in hv veh injured in clsn w oth and unsp mv in traf", guestPrerequisites: ["Polarised transitional core", "Future-proofed mission-critical support", "Open-source leading edge benchmark"], creationDate: ISO8601DateFormatter().date(from: "2020-08-27T02:20:23Z") ?? Date(), reviews: [MOCK_REVIEWS[0]],  isFavorite: false, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)),
    Experience(author: UserManager.mockAuthors[1], duration: 5900, price: 17, category: experiencesCategories[2], participationMode: .all, title: "Gardien pénitencier", description: "Toxic effect of unspecified metal, undetermined, sequela", guestPrerequisites: ["Function-based analyzing software", "Balanced 6th generation migration", "Object-based mobile infrastructure"], creationDate: ISO8601DateFormatter().date(from: "2020-11-01T13:48:40Z") ?? Date(), reviews: [MOCK_REVIEWS[4]],  isFavorite: false, location: CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436))
]
