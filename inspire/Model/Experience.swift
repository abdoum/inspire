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
    var participationMode : ParticipationMode = .solo
    var title : String
    var description : String
    var guestPrerequisites : [String] = []
    var creationDate : Date = Date()
    var reviews : [Review] = []
    var rate: String
    var averageRate : Double {
        Double(reviews.compactMap({$0.rate}).reduce(0, +) / 1 )
    }
    var location: CLLocationCoordinate2D
    // TODO: retreive coordinates using coreLocation
}

class SharedExperiences: ObservableObject {
    @Published var experiences = MOCK_EXPERIENCES
    @Published var leftExperiences = MOCK_EXPERIENCES.split().left.shuffled()
    @Published var rightExperiences = MOCK_EXPERIENCES.split().right.shuffled()
    
    func search(searchText: String) -> [Experience] {
        let selectedTags = ExperienceCategory(name: "any", image: "boulanger", specialisation: "").selectedTags.map({$0.text})
        let searchText = searchText.trimmingCharacters(in: .whitespaces)
        var results : [Optional<Experience>] = experiences.filter(
            { searchText.isEmpty ? true :
                $0.title.contains(searchText)
                || $0.description.contains(searchText)
                || $0.category.name.contains(searchText)
                || $0.category.specialisation.contains(searchText)
                
            })
        
        if !selectedTags.isEmpty {
            for tag in selectedTags{
         let tagSearchResults : [Experience] = experiences.filter(
                {
                    $0.title.contains(tag)
                    || $0.description.contains(tag)
                    || $0.category.name.contains(tag)
                    || $0.category.specialisation.contains(tag)
                })
                    results += tagSearchResults
            }
        }
       
        if  (!results.isEmpty) {
            return results.compactMap({$0})
        }else{
            return []
        }
    }
}

extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}

var MOCK_EXPERIENCES: [Experience] = [
    
    Experience(author: UserManager.mockAuthors[1], price: 49, category: experiencesCategories[1], participationMode: .all, title: "Boulanger", description: "Acqu??rir les connaissances, les habilet??s et les attitudes n??cessaires pour ??valuer les qualit??s physico-chimiques d'une p??te, choisir les mati??res premi??res selon les produits de boulangerie, d??terminer une recette de production, pr??parer des ferments et p??trir des p??tes, couper, bouler et fa??onner des p??tes, pr??parer et fa??onner des p??tes ?? pain, confectionner des viennoiseries et faire cuire le pain et les produits de boulangerie.", guestPrerequisites: ["Secured non-volatile utilisation", "Monitored optimizing artificial intelligence", "Multi-tiered client-server throughput"], creationDate: ISO8601DateFormatter().date(from: "2020-09-03T08:37:19Z") ?? Date(), reviews: [MOCK_REVIEWS[1]], rate: "4.0", location: .init(latitude: 48.84095396985569, longitude: 2.5456657137221073)),
    
    Experience(author: UserManager.mockAuthors[2], price: 83, category: experiencesCategories[2], participationMode: .solo, title: "Fleuriste", description: "Conna??tre le m??tier et son environnement professionnel. Assurer la gestion d???une boutique. Vendre, conseiller et fid??liser le client. D??crire et caract??riser les v??g??taux.??Identifier et expliquer le fonctionnement des v??g??taux. Conna??tre les v??g??taux dans leur environnement . Transformer et confectionner des productions florales. Confectionner des productions autour de la fleur. Confectionner des productions florales pour les grandes occasions", guestPrerequisites: ["Self-enabling needs-based moratorium", "Distributed impactful middleware", "Operative holistic process improvement"], creationDate: ISO8601DateFormatter().date(from: "2020-10-11T06:16:57Z") ?? Date(), reviews: [MOCK_REVIEWS[7]], rate: "2.70", location: .init(latitude: 48.949390798097696, longitude: 2.245547993516992)),
    
    Experience(author: UserManager.mockAuthors[3], price: 106, category: experiencesCategories[3], participationMode: .solo, title: "H??tesse d'Accueil", description: "Retour sur la gestion de l'accueil t??l??phonique??et de l'accueil physique. Appr??hender les fonctions de l'accueil : accueil, prise en charge du client, identification et secret professionnel. Focus sur les missions fondamentales de l'accueil :??Orienter le client, transmettre une information, r??pondre au t??l??phone, trouver une solution Valoriser l'image donn??e, l'image de votre entreprise dans votre fonction d'h??tesse d'accueil: Ma??triser les enjeux d'une pr??sentation soign??e. Comprendre l'importance da communication??verbal et le non verbal o?? comment communiquer avec professionnalisme. Mise au point sur la congruence verbale et non verbale : retour sur des principes en communication.", guestPrerequisites: ["Reduced executive adapter", "Networked 24 hour frame", "Decentralized uniform matrices"], creationDate: ISO8601DateFormatter().date(from: "2020-10-13T14:18:05Z") ?? Date(), reviews: [MOCK_REVIEWS[2]], rate: "3.90", location: .init(latitude: 48.75928567877003, longitude: 2.302813631147095)),
    
    Experience(author: UserManager.mockAuthors[4], price: 60, category: experiencesCategories[4], participationMode: .solo, title: "Coiffeur", description: "Le programme du BP Coiffure (qui a fait l???objet d???une r??solon en 2011), a pour ambition de fournir une formation compl??te aux futurs g??rants de salons de coiffure, tant sur les plans techniques que sur les plans administratif, commercial et relationnel. Ce programme est divis?? en 6 ?? savoirs ?? fondamentaux que vous devez ma??triser pour r??ussir l???examen du brevet pro. D??couvrez en un coup d?????il le r??sum?? des savoirs ?? acqu??rir pour obtenir le BP Coiffure, tels qu'ils sont indiqu??s dans le r??f??rentiel officiel.", guestPrerequisites: ["Profit-focused leading edge monitoring", "Integrated foreground moratorium", "User-centric heuristic strategy"], creationDate: ISO8601DateFormatter().date(from: "2021-05-16T09:14:06Z") ?? Date(), reviews: [MOCK_REVIEWS[5]], rate: "2.0", location: .init(latitude: 48.816637168578765, longitude: 2.143382393316152)),
    
    Experience(author: UserManager.mockAuthors[5], price: 80, category: experiencesCategories[5], participationMode: .solo, title: "V??t??rinaire", description: "- Anatomie v??t??rinaire - Anesth??siologie - Chirurgie g??n??rale - G??n??tique m??dicale - Nutrition animale - Ophtalmologie v??t??rinaire - Toxicologie clinique ", guestPrerequisites: ["Synergistic encompassing secured line", "Team-oriented real-time challenge", "Distributed context-sensitive service-desk"], creationDate: ISO8601DateFormatter().date(from: "2020-09-29T18:47:42Z") ?? Date(), reviews: [MOCK_REVIEWS[0]], rate: "3.3", location: .init(latitude: 48.89276500949943, longitude: 2.2040416887332115)),
    
    Experience(author: UserManager.mockAuthors[8], price: 57, category: experiencesCategories[7], participationMode: .all, title: "Sapeur Pompier", description: "La pr??vention et l'??valuation des risques de s??curit?? civile ; La pr??paration des mesures de sauvegarde et l'organisation des moyens de secours ;??La protection des personnes, des biens et de l'environnement ;??Les secours d'urgence aux personnes victimes d'accidents, de sinistres ou de catastrophes ainsi que leur ??vacuation.??", guestPrerequisites: ["Polarised transitional core", "Future-proofed mission-critical support", "Open-source leading edge benchmark"], creationDate: ISO8601DateFormatter().date(from: "2020-08-27T02:20:23Z") ?? Date(), reviews: [MOCK_REVIEWS[1]], rate: "4.8", location: .init(latitude: 48.8013, longitude: 2.6076)),
    
    Experience(author: UserManager.mockAuthors[7], price: 57, category: experiencesCategories[8], participationMode: .all, title: "Sapeur Pompier", description: "La pr??vention et l'??valuation des risques de s??curit?? civile ; La pr??paration des mesures de sauvegarde et l'organisation des moyens de secours ;??La protection des personnes, des biens et de l'environnement ;??Les secours d'urgence aux personnes victimes d'accidents, de sinistres ou de catastrophes ainsi que leur ??vacuation.??", guestPrerequisites: ["Polarised transitional core", "Future-proofed mission-critical support", "Open-source leading edge benchmark"], creationDate: ISO8601DateFormatter().date(from: "2020-08-27T02:20:23Z") ?? Date(), reviews: [MOCK_REVIEWS[1]], rate: "3.8", location: .init(latitude: 48.8013, longitude: 2.6076)),
    
    Experience(author: UserManager.mockAuthors[8], price: 57, category: experiencesCategories[9], participationMode: .all, title: "Sapeur Pompier", description: "La pr??vention et l'??valuation des risques de s??curit?? civile ; La pr??paration des mesures de sauvegarde et l'organisation des moyens de secours ;??La protection des personnes, des biens et de l'environnement ;??Les secours d'urgence aux personnes victimes d'accidents, de sinistres ou de catastrophes ainsi que leur ??vacuation.??", guestPrerequisites: ["Polarised transitional core", "Future-proofed mission-critical support", "Open-source leading edge benchmark"], creationDate: ISO8601DateFormatter().date(from: "2020-08-27T02:20:23Z") ?? Date(), reviews: [MOCK_REVIEWS[1]], rate: "4.8", location: .init(latitude: 48.8013, longitude: 2.6076)),
    
    Experience(author: UserManager.mockAuthors[9], price: 57, category: experiencesCategories[10], participationMode: .all, title: "Sapeur Pompier", description: "La pr??vention et l'??valuation des risques de s??curit?? civile ; La pr??paration des mesures de sauvegarde et l'organisation des moyens de secours ;??La protection des personnes, des biens et de l'environnement ;??Les secours d'urgence aux personnes victimes d'accidents, de sinistres ou de catastrophes ainsi que leur ??vacuation.??", guestPrerequisites: ["Polarised transitional core", "Future-proofed mission-critical support", "Open-source leading edge benchmark"], creationDate: ISO8601DateFormatter().date(from: "2020-08-27T02:20:23Z") ?? Date(), reviews: [MOCK_REVIEWS[1]], rate: "4.1", location: .init(latitude: 48.8013, longitude: 2.6076)),
    
    Experience(author: UserManager.mockAuthors[6], price: 106, category: experiencesCategories[11], participationMode: .solo, title: "Architecte d'int??rieur", description: "??nonc?? des caract??ristiques pr??cises d???un ??difice ?? concevoir et ?? r??aliser remis aux architectes candidats pour servir de base ?? leur ??tude et ?? l?????tablissement de leur projet.", guestPrerequisites: ["Quality-focused bandwidth-monitored protocol", "Horizontal heuristic encoding", "solonary composite array"], creationDate: ISO8601DateFormatter().date(from: "2020-06-10T05:47:20Z") ?? Date(), reviews: [MOCK_REVIEWS[8]], rate: "3.5", location: .init(latitude: 48.781257431431484, longitude: 2.4675872213096426)),
   
    Experience(author: UserManager.mockAuthors[10], price: 106, category: experiencesCategories[15], participationMode: .solo, title: "Architecte d'int??rieur", description: "??nonc?? des caract??ristiques pr??cises d???un ??difice ?? concevoir et ?? r??aliser remis aux architectes candidats pour servir de base ?? leur ??tude et ?? l?????tablissement de leur projet.", guestPrerequisites: ["Quality-focused bandwidth-monitored protocol", "Horizontal heuristic encoding", "solonary composite array"], creationDate: ISO8601DateFormatter().date(from: "2020-06-10T05:47:20Z") ?? Date(), reviews: [MOCK_REVIEWS[8]], rate: "3.5", location: .init(latitude: 48.781257431431484, longitude: 2.4675872213096426)),
    
    Experience(author: UserManager.mockAuthors[0], price: 70, category: experiencesCategories[0], participationMode: .solo, title: "Ing??nieur", description: "Sp??cialiste en informatique, ??lectronique ou t??l??coms. Intervention sur la programmation des composants informatiques et sur le design des circuits ??lectroniques. Participation ?? la d??finition technique du mat??riel ??lectronique puis ?? son d??veloppement. Le tout ?? partir de sp??cifications d??finies pr??alablement. Analyse et la programmation des syst??mes de t??l??communication en temps r??el.", guestPrerequisites: [""], creationDate: Date(), reviews: [MOCK_REVIEWS[3]], rate: "4.5", location: .init(latitude: 22.9108638, longitude: 43.2045436))
]
