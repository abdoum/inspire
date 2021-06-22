//
//  FavorisManager.swift
//  inspire
//
//  Created by Jonathan Duong on 21/06/2021.
//

import SwiftUI

class FavorisManager: ObservableObject {
    @Published var favoris: [Experience] = [SharedExperiences().experiences[0],SharedExperiences().experiences[2]]
    
    func addFavoris(experience: Experience) {
        favoris.append(experience)
    }
    func isLike(experience: Experience) -> Bool {
        favoris.first { $0.id == experience.id } != nil
    }
    func removeFavoris(experience: Experience) {
        if let index = favoris.firstIndex(where: { $0.id == experience.id }) {
            favoris.remove(at: index)
        }
    }
}
