//
//  NeedsData.swift
//  inspire
//
//  Created by mac11 on 17/06/2021.
//

import Foundation

struct Need: Hashable {
    var id: Int
    var needText:  String
    var isSelectedNeed: Bool
}

var need1 = Need(id: 1, needText: "Il provient en fait des sections 1.10.32 et 1.10.33 du -De Finibus Bonorum et Malorum- (Des Suprêmes Biens et des Suprêmes Maux) de Cicéron.", isSelectedNeed: false)
var need2 = Need(id: 2, needText: "Cet ouvrage, très populaire pendant la Renaissance, est un traité sur la théorie de l'éthique. Les premières lignes du Lorem Ipsum, -Lorem ipsum dolor sit amet...-, proviennent de la section 1.10.32.-, ", isSelectedNeed: false)
var need3 = Need(id: 3, needText: "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même", isSelectedNeed: false)

var needs: [Need] = [need1, need2, need3]

