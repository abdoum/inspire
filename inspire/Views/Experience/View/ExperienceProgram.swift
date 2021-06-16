//
//  ExperienceProgram.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceProgram: View {
    var body: some View {
        VStack {
            HStack {
                Text("Au programme")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .font(.title2)
                Spacer()
            }
            Text("""
1/2 Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte.
""")
                .font(.subheadline)
            
            HStack {
                Button(action: {}) {
                    HStack {
                        Spacer()
                        Text("Lire plus")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .underline()
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                }
                Spacer()
            }
            
            Text("""
2/2 Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte.
""")
                .font(.subheadline)
        }
        
    }
}

struct ExperienceProgram_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceProgram()
    }
}
