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
    var password: String
    var avatar: String
    var biography: String
    var spokenLanguages: String
    var bookedSessions: [Session] = [] // FIX: caused circular reference errors with MOCK_SESSIONS
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 22.9108638, longitude: 43.2045436)
    var notificationsAccepted: Bool? = false
    var role: UserRole
    var isLogged: Bool = false
}
//var biography : String = ""
//var avatar : String = "https://i.pravatar.cc/150"
extension User {
    init(user: SignUpUser) {
        self.firstname = user.firstname
        self.lastname = user.lastname
        self.email = user.email
        self.password = user.password
        self.avatar = user.avatar
        self.biography = user.biography
        self.spokenLanguages = user.spokenLanguages
        self.role = user.role
    }
}

struct SignUpUser {
    var firstname: String
    var lastname: String
    var email: String
    var password: String
    var confirmPassword: String
    var avatar: String
    var biography: String
    var spokenLanguages: String
    var role: UserRole
}
extension SignUpUser {
    static let empty: SignUpUser = SignUpUser(firstname: "", lastname: "", email: "", password: "", confirmPassword: "", avatar: "", biography: "", spokenLanguages: "", role: .guest)
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
        
        User(firstname: "Valentin", lastname: "Jizhaki", email: "test1@test.com", password: "123456", avatar: "ingenierie", biography: "Etudes et diplômes : collège et lycée Sainte-Marie à Anthony; maîtrise de mathématiques et informatique (université Nancy I-Henri Poincaré)", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 39.302809, longitude: 99.275837), notificationsAccepted: false, role: UserRole.author, isLogged: true),
        
        User(firstname: "Hugo", lastname: "Armiger", email: "test2@test.com", password: "123456", avatar: "boulanger", biography: "Il ouvre une école de pâtisserie pour faire découvrir et transmettre le vrai métier de pâtissier. Dans un premier espace entièrement dédié à la pâtisserie au 60, rue du Faubourg-Poissonnière dans le 10ème à Paris, il propose des cours pour les particuliers, ainsi qu'une boutique de vente à emporter.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 18.740381, longitude: 109.735832), notificationsAccepted: true, role: UserRole.author, isLogged: true),
        
        User(firstname: "Céline", lastname: "Broadfield", email: "test3@test.com", password: "123456", avatar: "fleuriste", biography: "Un fleuriste est un artisan spécialisé dans la vente de fleurs et la confection de bouquets de fleurs et d'assemblages appelés « compositions », mais c'est aussi un « artiste » à sa manière. Il s'approvisionne chez un horticulteur ou chez un grossiste ou même « au cadran » principalement aux Pays-Bas. Il compose des bouquets et peut renseigner les clients sur les caractéristiques de chaque plante ou fleur. ", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 13.6615154, longitude: 123.1900935), notificationsAccepted: false, role: .author, isLogged: false),
        
        User(firstname: "François", lastname: "Polleye", email: "test4@test.com", password: "123456", avatar: "hotellerie", biography: "En entreprise, elle oriente les visiteurs dans les locaux, les dirige vers les services compétents, répond aux demandes d’information, effectue des réservations de taxi. Elle joue également très souvent le rôle de standardiste, tout en assumant des tâches de secrétariat (classement, traitement de texte, mise à jour de fichiers). Dans les foires et les salons (hôtesse d'accueil dans l'événementiel), en plus de l’accueil, elle remplit fréquemment une fonction de démonstratrice ou d’interprète. Dans les structures touristiques (offices de tourisme, villages de vacances…), elle incite le public à séjourner dans la région, l’informe sur les hébergements, le patrimoine touristique, les animations culturelles et peut effectuer elle-même les réservations d’hôtels ou de spectacles. Dans l’hôtellerie, c’est elle qui prend en charge les arrivées et les départs, réserve les chambres et donne des renseignements touristiques.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 41.0377245, longitude: 21.3300873), notificationsAccepted: true, role: .author, isLogged: false),
        
        User(firstname: "Miléna", lastname: "Deware", email: "test5@test.com", password: "123456", avatar: "coiffeur", biography: "Passionnée de coiffure depuis toujours, c’est en famille dès l’âge de 16ans que Miléna Deware commence sa formation. Son style unique, intemporel et sophistiqué ainsi que sa ténacité et sa rigueur lui permettent d’intégrer dès 2011 l’équipe régionale d’Alsace de coiffure. Sacrée Championne de France en coupe stylisée et coiffage en 2004, ce titre lui permet d’intégrer la prestigieuse équipe de France, qu’elle quittera après une victoire éclatante, celle du Grand Prix International en Chignon de Mariée de Prestige, au Mondial Coiffure Beauté.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 24.479833, longitude: 118.089425), notificationsAccepted: false, role: .author, isLogged: false),
        
        User(firstname: "Sophie", lastname: "Ventum", email: "test6@test.com", password: "123456", avatar: "profileveto", biography: "Durant ses études, Sophie Ventum a pris une année sabbatique de perfectionnement afin d’effectuer des stages et de suivre des cours à l’École Nationale Vétérinaire de Lyon en France. Cette année exceptionnelle, en plus de lui donner la chance de vivre une expérience culturelle enrichissante, lui a fourni l’occasion de perfectionner ses notions de médecine et de chirurgie dans le domaine des petits animaux. Durant cette année d’étude outre-mer, de multiples voyages (Tunisie, Turquie, Italie) lui ont apporté une vision multiculturelle du monde et lui ont également permis de parfaire ses connaissances médicales dans différentes institutions d’enseignement dont Tierärtzliche Hochschule, Université vétérinaire située à Hanovre en Allemagne.", spokenLanguages: "Francais",location: CLLocationCoordinate2D(latitude: -23.216667, longitude: 46.6666669), notificationsAccepted: true, role: .author, isLogged: false),
        
        User(firstname: "Hélène", lastname: "Ly", email: "test7@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=35", biography: "Mandatory even-keeled core", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true),
        
        User(firstname: "Frédérique", lastname: "Huston", email: "test7@test.com", password: "123456", avatar: "profilepompier", biography: "Né le 13 juillet 1965 à Montreuil, le général Frédérique Huston commande la brigade de sapeurs-pompiers de Paris, depuis le 30 novembre 2019. Après une scolarité à l’École militaire préparatoire d’Autun, il suit des études supérieures à l’université du Panthéon-Sorbonne (1983/1988), où il obtient un DEA d’économie publique et un DESS de sciences-politiques, tout en étant rédacteur/crédits entreprises dans une grande banque parisienne.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true)
        
    ]

    static let mockGuests = [
        
        User(firstname: "Christine", lastname: "Filyukov", email: "test15@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=32", biography: "J'ai 25 ans et je suis à la recherche d'un poste en cuisine", spokenLanguages: "Francais",  bookedSessions: [MOCK_SESSIONS[0], MOCK_SESSIONS[1]], location: CLLocationCoordinate2D(latitude: 58.9015864, longitude: 5.7123282), notificationsAccepted: true, role: UserRole.guest, isLogged: true),
        
        User(firstname: "Maëly", lastname: "Watmough", email: "test16@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=38", biography: "32 ans cette année, je recherche un job d'été.", spokenLanguages: "Francais", bookedSessions: [MOCK_SESSIONS[2], MOCK_SESSIONS[3]], location: CLLocationCoordinate2D(latitude: -0.35294, longitude: -79.66033), notificationsAccepted: true, role: UserRole.guest, isLogged: true),
        
        User(firstname: "Solenne", lastname: "Behning", email: "test17@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=41", biography: "Je m'appelle Solenne, j'ai 30 ans. Je souhaite aujourd'hui me reconvertir dans la restauration", spokenLanguages: "Francais", bookedSessions: [MOCK_SESSIONS[4], MOCK_SESSIONS[5], MOCK_SESSIONS[6], MOCK_SESSIONS[7], MOCK_SESSIONS[8]], location: CLLocationCoordinate2D(latitude: 40.645924, longitude: 115.540353), notificationsAccepted: false, role: UserRole.guest, isLogged: false),
        
        User(firstname: "Cyndie", lastname: "Doerrling", email: "test18@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=28", biography: "Diplômé d'un Doctorat en médecine, je recherche un poste dans ce domaine.", spokenLanguages: "Francais",location: CLLocationCoordinate2D(latitude: -8.2725, longitude: 123.3991), notificationsAccepted: false, role: .guest, isLogged: false),
        
        User(firstname: "Maïlis", lastname: "Leed", email: "test19@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=20", biography: "Créatif, ambitieuse et passionnée d'Art !", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 47.6451517, longitude: 42.0889476), notificationsAccepted: true, role: .guest, isLogged: false),
        
        User(firstname: "Laure", lastname: "Negri", email: "test14@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=29", biography: "10 ans de métier en tant que coach sportif", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 48.7528373, longitude: 2.5304644), notificationsAccepted: true, role: .guest, isLogged: true),
        
        User(firstname: "Hélèna", lastname: "Buckam", email: "test20@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=30", biography: "Aucune information...", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 35.950418, longitude: 101.925248), notificationsAccepted: false, role: .guest, isLogged: true)
    ]
}

