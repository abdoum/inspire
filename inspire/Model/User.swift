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
        
        User(firstname: "Valentin", lastname: "Jizhaki", email: "test1@test.com", password: "123456", avatar: "ingenierie", biography: "Etudes et dipl??mes : coll??ge et lyc??e Sainte-Marie ?? Anthony; ma??trise de math??matiques et informatique (universit?? Nancy I-Henri Poincar??)", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 39.302809, longitude: 99.275837), notificationsAccepted: false, role: UserRole.author, isLogged: true),
        
        User(firstname: "Hugo", lastname: "Armiger", email: "test2@test.com", password: "123456", avatar: "boulanger", biography: "Il ouvre une ??cole de p??tisserie pour faire d??couvrir et transmettre le vrai m??tier de p??tissier. Dans un premier espace enti??rement d??di?? ?? la p??tisserie au 60, rue du Faubourg-Poissonni??re dans le 10??me ?? Paris, il propose des cours pour les particuliers, ainsi qu'une boutique de vente ?? emporter.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 18.740381, longitude: 109.735832), notificationsAccepted: true, role: UserRole.author, isLogged: true),
        
        User(firstname: "C??line", lastname: "Broadfield", email: "test3@test.com", password: "123456", avatar: "fleuriste", biography: "Un fleuriste est un artisan sp??cialis?? dans la vente de fleurs et la confection de bouquets de fleurs et d'assemblages appel??s ?? compositions ??, mais c'est aussi un ?? artiste ?? ?? sa mani??re. Il s'approvisionne chez un horticulteur ou chez un grossiste ou m??me ?? au cadran ?? principalement aux Pays-Bas. Il compose des bouquets et peut renseigner les clients sur les caract??ristiques de chaque plante ou fleur. ", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 13.6615154, longitude: 123.1900935), notificationsAccepted: false, role: .author, isLogged: false),
        
        User(firstname: "Fran??ois", lastname: "Polleye", email: "test4@test.com", password: "123456", avatar: "hotellerie", biography: "En entreprise, elle oriente les visiteurs dans les locaux, les dirige vers les services comp??tents, r??pond aux demandes d???information, effectue des r??servations de taxi. Elle joue ??galement tr??s souvent le r??le de standardiste, tout en assumant des t??ches de secr??tariat (classement, traitement de texte, mise ?? jour de fichiers). Dans les foires et les salons (h??tesse d'accueil dans l'??v??nementiel), en plus de l???accueil, elle remplit fr??quemment une fonction de d??monstratrice ou d???interpr??te. Dans les structures touristiques (offices de tourisme, villages de vacances???), elle incite le public ?? s??journer dans la r??gion, l???informe sur les h??bergements, le patrimoine touristique, les animations culturelles et peut effectuer elle-m??me les r??servations d???h??tels ou de spectacles. Dans l???h??tellerie, c???est elle qui prend en charge les arriv??es et les d??parts, r??serve les chambres et donne des renseignements touristiques.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 41.0377245, longitude: 21.3300873), notificationsAccepted: true, role: .author, isLogged: false),
        
        User(firstname: "Mil??na", lastname: "Deware", email: "test5@test.com", password: "123456", avatar: "coiffeur", biography: "Passionn??e de coiffure depuis toujours, c???est en famille d??s l?????ge de 16ans que Mil??na Deware commence sa formation. Son style unique, intemporel et sophistiqu?? ainsi que sa t??nacit?? et sa rigueur lui permettent d???int??grer d??s 2011 l?????quipe r??gionale d???Alsace de coiffure. Sacr??e Championne de France en coupe stylis??e et coiffage en 2004, ce titre lui permet d???int??grer la prestigieuse ??quipe de France, qu???elle quittera apr??s une victoire ??clatante, celle du Grand Prix International en Chignon de Mari??e de Prestige, au Mondial Coiffure Beaut??.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 24.479833, longitude: 118.089425), notificationsAccepted: false, role: .author, isLogged: false),
        
        User(firstname: "Sophie", lastname: "Ventum", email: "test6@test.com", password: "123456", avatar: "profileveto", biography: "Durant ses ??tudes, Sophie Ventum a pris une ann??e sabbatique de perfectionnement afin d???effectuer des stages et de suivre des cours ?? l?????cole Nationale V??t??rinaire de Lyon en France. Cette ann??e exceptionnelle, en plus de lui donner la chance de vivre une exp??rience culturelle enrichissante, lui a fourni l???occasion de perfectionner ses notions de m??decine et de chirurgie dans le domaine des petits animaux. Durant cette ann??e d?????tude outre-mer, de multiples voyages (Tunisie, Turquie, Italie) lui ont apport?? une vision multiculturelle du monde et lui ont ??galement permis de parfaire ses connaissances m??dicales dans diff??rentes institutions d???enseignement dont Tier??rtzliche Hochschule, Universit?? v??t??rinaire situ??e ?? Hanovre en Allemagne.", spokenLanguages: "Francais",location: CLLocationCoordinate2D(latitude: -23.216667, longitude: 46.6666669), notificationsAccepted: true, role: .author, isLogged: false),
        
        User(firstname: "H??l??ne", lastname: "Ly", email: "test7@test.com", password: "123456", avatar: "marie", biography: "Mandatory even-keeled core", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true),
        
        User(firstname: "Fr??d??rique", lastname: "Huston", email: "test8@test.com", password: "123456", avatar: "profilepompier", biography: "N?? le 13 juillet 1965 ?? Montreuil, le g??n??ral Fr??d??rique Huston commande la brigade de sapeurs-pompiers de Paris, depuis le 30 novembre 2019. Apr??s une scolarit?? ?? l?????cole militaire pr??paratoire d???Autun, il suit des ??tudes sup??rieures ?? l???universit?? du Panth??on-Sorbonne (1983/1988), o?? il obtient un DEA d?????conomie publique et un DESS de sciences-politiques, tout en ??tant r??dacteur/cr??dits entreprises dans une grande banque parisienne.", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true),
        
        User(firstname: "Vernor", lastname: "Inott", email: "test9@test.com", password: "123456", avatar: "pensif", biography: "Mandatory even-keeled core", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true),
        
        User(firstname: "Jean", lastname: "Darbon", email: "test10@test.com", password: "123456", avatar: "monochromeman", biography: "Mandatory even-keeled core", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true),
        
        User(firstname: "Mark", lastname: "Charbon", email: "test11@test.com", password: "123456", avatar: "veloman", biography: "Mandatory even-keeled core", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 56.4475016, longitude: 36.5587561), notificationsAccepted: true, role: .author, isLogged: true)
        
    ]

    static let mockGuests = [
        
        User(firstname: "Christine", lastname: "Filyukov", email: "test15@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=32", biography: "J'ai 25 ans et je suis ?? la recherche d'un poste en cuisine", spokenLanguages: "Francais",  bookedSessions: [MOCK_SESSIONS[0], MOCK_SESSIONS[1]], location: CLLocationCoordinate2D(latitude: 58.9015864, longitude: 5.7123282), notificationsAccepted: true, role: UserRole.guest, isLogged: true),
        
        User(firstname: "Ma??ly", lastname: "Watmough", email: "test16@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=38", biography: "32 ans cette ann??e, je recherche un job d'??t??.", spokenLanguages: "Francais", bookedSessions: [MOCK_SESSIONS[2], MOCK_SESSIONS[3]], location: CLLocationCoordinate2D(latitude: -0.35294, longitude: -79.66033), notificationsAccepted: true, role: UserRole.guest, isLogged: true),
        
        User(firstname: "Solenne", lastname: "Behning", email: "test17@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=41", biography: "Je m'appelle Solenne, j'ai 30 ans. Je souhaite aujourd'hui me reconvertir dans la restauration", spokenLanguages: "Francais", bookedSessions: [MOCK_SESSIONS[4], MOCK_SESSIONS[5], MOCK_SESSIONS[6], MOCK_SESSIONS[7], MOCK_SESSIONS[8]], location: CLLocationCoordinate2D(latitude: 40.645924, longitude: 115.540353), notificationsAccepted: false, role: UserRole.guest, isLogged: false),
        
        User(firstname: "Cyndie", lastname: "Doerrling", email: "test18@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=28", biography: "Dipl??m?? d'un Doctorat en m??decine, je recherche un poste dans ce domaine.", spokenLanguages: "Francais",location: CLLocationCoordinate2D(latitude: -8.2725, longitude: 123.3991), notificationsAccepted: false, role: .guest, isLogged: false),
        
        User(firstname: "Ma??lis", lastname: "Leed", email: "test19@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=20", biography: "Cr??atif, ambitieuse et passionn??e d'Art !", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 47.6451517, longitude: 42.0889476), notificationsAccepted: true, role: .guest, isLogged: false),
        
        User(firstname: "Laure", lastname: "Negri", email: "test14@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=29", biography: "10 ans de m??tier en tant que coach sportif", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 48.7528373, longitude: 2.5304644), notificationsAccepted: true, role: .guest, isLogged: true),
        
        User(firstname: "H??l??na", lastname: "Buckam", email: "test20@test.com", password: "123456", avatar: "https://i.pravatar.cc/100?img=30", biography: "Aucune information...", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 35.950418, longitude: 101.925248), notificationsAccepted: false, role: .guest, isLogged: true),
        
        User(firstname: "Ru??", lastname: "Shorte", email: "test20@test.com", password: "123456", avatar: "skiman", biography: "Aucune information...", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 35.950418, longitude: 101.925248), notificationsAccepted: false, role: .guest, isLogged: true),
        
        User(firstname: "L??ng", lastname: "Feige", email: "test20@test.com", password: "123456", avatar: "veloman", biography: "Aucune information...", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 35.950418, longitude: 101.925248), notificationsAccepted: false, role: .guest, isLogged: true)
    ]
}

