//
//  InfosProfileView.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI

struct Infos: Identifiable {
    let id = UUID()
    let imageName: String
    let details: String
}

struct InfosRow: View {
    var infos: Infos
    var body: some View {
        HStack {
            Image(systemName: infos.imageName)
            Text(infos.details)
                .padding(.leading, 2)
        }
    }
}


struct InfosProfileView: View {
    
    let informations = [
        Infos(imageName: "mappin", details: " Paris, France"),
        Infos(imageName: "speaker.wave.2", details: "Langue: Français et Anglais"),
        Infos(imageName: "latch.2.case", details: "Serveuse chez Bar café Paris")
    ]
    
    var body: some View {
        List(informations) { information in
            InfosRow(infos: information)
        }
        .frame(width: UIScreen.main.bounds.width)
        .frame(height: 150)
        
    }
}

struct InfosProfileView_Previews: PreviewProvider {
    static var previews: some View {
        InfosProfileView()
    }
}
