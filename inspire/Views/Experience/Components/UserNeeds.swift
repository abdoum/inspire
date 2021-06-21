//
//  UserNeeds.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct UserNeeds: View {
    
    var items = [
        "Il provient en fait des sections 1.10.32 et 1.10.33 du -De Finibus Bonorum et Malorum- (Des Suprêmes Biens et des Suprêmes Maux) de Cicéron.",
        "Cet ouvrage, très populaire pendant la Renaissance, est un traité sur la théorie de l'éthique. Les premières lignes du Lorem Ipsum, -Lorem ipsum dolor sit amet...-, proviennent de la section 1.10.32.-, ",
        "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même"]
    
    @State private var isSelectedNeed: Bool = false
    @State private var isSelectedNeed1: Bool = false
    @State private var isSelectedNeed2: Bool = false
    
    func buttonSelected(items: [String], index: Int, color: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName:color ? "checkmark.circle" : "xmark.circle")
                    .foregroundColor(color ? .green : .red)
                    .opacity(0.5)
                    .font(.system(size: 30))
                Text(items[index])
                Spacer()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 2)
                .opacity(0.3))
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Ce qu'il faut préparer")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical)
                Spacer()
            }
            buttonSelected(items: items, index: 0, color: isSelectedNeed, action: {isSelectedNeed.toggle()})
            buttonSelected(items: items, index: 1, color: isSelectedNeed1, action: {isSelectedNeed1.toggle()})
            buttonSelected(items: items, index: 2, color: isSelectedNeed2, action: {isSelectedNeed2.toggle()})
        }
        .padding()
    }
}



struct UserNeeds_Previews: PreviewProvider {
    static var previews: some View {
        UserNeeds()
    }
}
