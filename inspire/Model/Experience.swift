//
//  Experience.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation
import MapKit

struct Experience : Identifiable {
    let id : UUID = UUID()
    let author : User
    // TODO: make function to calculate price based on pariticipation mode
    var price : Int
    var category : ExperienceCategory
    var participationMode : ParticipationMode = .visio
    var title : String
    var description : String
    var guestPrerequisites : [String] = []
    var creationDate : Date = Date()
    var reviews : [Review] = []
    var rate: String
    var averageRate : Double {
        Double(reviews.compactMap({$0.rate}).reduce(0, +) / reviews.count)
    }
    var isFavorite : Bool = false
    var location: CLLocationCoordinate2D
    // TODO: retreive coordinates using coreLocation
}

class SharedExperiences: ObservableObject {
    @Published var experiences = MOCK_EXPERIENCES
}

var MOCK_EXPERIENCES: [Experience] = [
    Experience(author: UserManager.mockAuthors[0], price: 70, category: experiencesCategories[0], participationMode: .visio, title: "Ingénieur", description: "Spécialiste en informatique, électronique ou télécoms. Intervention sur la programmation des composants informatiques et sur le design des circuits électroniques. Participation à la définition technique du matériel électronique puis à son développement. Le tout à partir de spécifications définies préalablement. Analyse et la programmation des systèmes de télécommunication en temps réel.", guestPrerequisites: [""], creationDate: Date(), reviews: [MOCK_REVIEWS[3]], rate: "4.5/5", isFavorite: false, location: .init(latitude: 22.9108638, longitude: 43.2045436)),
    
    Experience(author: UserManager.mockAuthors[1], price: 49, category: experiencesCategories[1], participationMode: .all, title: "Boulanger", description: "Acquérir les connaissances, les habiletés et les attitudes nécessaires pour évaluer les qualités physico-chimiques d'une pâte, choisir les matières premières selon les produits de boulangerie, déterminer une recette de production, préparer des ferments et pétrir des pâtes, couper, bouler et façonner des pâtes, préparer et façonner des pâtes à pain, confectionner des viennoiseries et faire cuire le pain et les produits de boulangerie.", guestPrerequisites: ["Secured non-volatile utilisation", "Monitored optimizing artificial intelligence", "Multi-tiered client-server throughput"], creationDate: ISO8601DateFormatter().date(from: "2020-09-03T08:37:19Z") ?? Date(), reviews: [MOCK_REVIEWS[1]], rate: "4.0/5",  isFavorite: true, location: .init(latitude: 48.84095396985569, longitude: 2.5456657137221073)),
    
    Experience(author: UserManager.mockAuthors[2], price: 83, category: experiencesCategories[2], participationMode: .visio, title: "Fleuriste", description: "Connaître le métier et son environnement professionnel. Assurer la gestion d’une boutique. Vendre, conseiller et fidéliser le client. Décrire et caractériser les végétaux. Identifier et expliquer le fonctionnement des végétaux. Connaître les végétaux dans leur environnement . Transformer et confectionner des productions florales. Confectionner des productions autour de la fleur. Confectionner des productions florales pour les grandes occasions", guestPrerequisites: ["Self-enabling needs-based moratorium", "Distributed impactful middleware", "Operative holistic process improvement"], creationDate: ISO8601DateFormatter().date(from: "2020-10-11T06:16:57Z") ?? Date(), reviews: [MOCK_REVIEWS[7]], rate: "2.70/5",  isFavorite: true, location: .init(latitude: 48.949390798097696, longitude: 2.245547993516992)),
    
    Experience(author: UserManager.mockAuthors[3], price: 106, category: experiencesCategories[3], participationMode: .visio, title: "Hôtesse d'Accueil", description: "Retour sur la gestion de l'accueil téléphonique et de l'accueil physique. Appréhender les fonctions de l'accueil : accueil, prise en charge du client, identification et secret professionnel. Focus sur les missions fondamentales de l'accueil : Orienter le client, transmettre une information, répondre au téléphone, trouver une solution Valoriser l'image donnée, l'image de votre entreprise dans votre fonction d'hôtesse d'accueil: Maîtriser les enjeux d'une présentation soignée. Comprendre l'importance da communication verbal et le non verbal où comment communiquer avec professionnalisme. Mise au point sur la congruence verbale et non verbale : retour sur des principes en communication.", guestPrerequisites: ["Reduced executive adapter", "Networked 24 hour frame", "Decentralized uniform matrices"], creationDate: ISO8601DateFormatter().date(from: "2020-10-13T14:18:05Z") ?? Date(), reviews: [MOCK_REVIEWS[2]], rate: "3.90/5",  isFavorite: true, location: .init(latitude: 48.75928567877003, longitude: 2.302813631147095)),
    
    Experience(author: UserManager.mockAuthors[4], price: 60, category: experiencesCategories[4], participationMode: .solo, title: "Coiffeur", description: "Le programme du BP Coiffure (qui a fait l’objet d’une révision en 2011), a pour ambition de fournir une formation complète aux futurs gérants de salons de coiffure, tant sur les plans techniques que sur les plans administratif, commercial et relationnel. Ce programme est divisé en 6 « savoirs » fondamentaux que vous devez maîtriser pour réussir l’examen du brevet pro. Découvrez en un coup d’œil le résumé des savoirs à acquérir pour obtenir le BP Coiffure, tels qu'ils sont indiqués dans le référentiel officiel.", guestPrerequisites: ["Profit-focused leading edge monitoring", "Integrated foreground moratorium", "User-centric heuristic strategy"], creationDate: ISO8601DateFormatter().date(from: "2021-05-16T09:14:06Z") ?? Date(), reviews: [MOCK_REVIEWS[5]], rate: "2.0/5", isFavorite: true, location: .init(latitude: 48.816637168578765, longitude: 2.143382393316152)),
    
    Experience(author: UserManager.mockAuthors[5], price: 80, category: experiencesCategories[5], participationMode: .visio, title: "Vétérinaire", description: "- Anatomie vétérinaire - Anesthésiologie - Chirurgie générale - Génétique médicale - Nutrition animale - Ophtalmologie vétérinaire - Toxicologie clinique ", guestPrerequisites: ["Synergistic encompassing secured line", "Team-oriented real-time challenge", "Distributed context-sensitive service-desk"], creationDate: ISO8601DateFormatter().date(from: "2020-09-29T18:47:42Z") ?? Date(), reviews: [MOCK_REVIEWS[0]], rate: "3.3/5",  isFavorite: true, location: .init(latitude: 48.89276500949943, longitude: 2.2040416887332115)),
    
    Experience(author: UserManager.mockAuthors[6], price: 106, category: experiencesCategories[7], participationMode: .visio, title: "Architecte", description: "Énoncé des caractéristiques précises d’un édifice à concevoir et à réaliser remis aux architectes candidats pour servir de base à leur étude et à l’établissement de leur projet.", guestPrerequisites: ["Quality-focused bandwidth-monitored protocol", "Horizontal heuristic encoding", "Visionary composite array"], creationDate: ISO8601DateFormatter().date(from: "2020-06-10T05:47:20Z") ?? Date(), reviews: [MOCK_REVIEWS[8]], rate: "3.5/5",  isFavorite: true, location: .init(latitude: 48.781257431431484, longitude: 2.4675872213096426)),
    
    Experience(author: UserManager.mockAuthors[7], price: 57, category: experiencesCategories[8], participationMode: .all, title: "Sapeur Pompier", description: "La prévention et l'évaluation des risques de sécurité civile ; La préparation des mesures de sauvegarde et l'organisation des moyens de secours ; La protection des personnes, des biens et de l'environnement ; Les secours d'urgence aux personnes victimes d'accidents, de sinistres ou de catastrophes ainsi que leur évacuation. ", guestPrerequisites: ["Polarised transitional core", "Future-proofed mission-critical support", "Open-source leading edge benchmark"], creationDate: ISO8601DateFormatter().date(from: "2020-08-27T02:20:23Z") ?? Date(), reviews: [MOCK_REVIEWS[0]], rate: "3.8/5",  isFavorite: false, location: .init(latitude: 48.8013, longitude: 2.6076))
    
    
//    Experience(author: UserManager.mockAuthors[1], price: 17, category: experiencesCategories[8], participationMode: .all, title: "Legal Assistant", description: "Toxic effect of unspecified metal, undetermined, sequela", guestPrerequisites: ["Function-based analyzing software", "Balanced 6th generation migration", "Object-based mobile infrastructure"], creationDate: ISO8601DateFormatter().date(from: "2020-11-01T13:48:40Z") ?? Date(), reviews: [MOCK_REVIEWS[4]],  isFavorite: false, location: .init(latitude: 22.9108638, longitude: 43.2045436))
]
