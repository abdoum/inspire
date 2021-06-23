//
//  InfosProfileView.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI


struct InfosProfileView2: View {
   
    func infos(imageName: String, description: String) -> some View {
        HStack {
            Image(systemName: imageName)
            Text(description)
                .padding(.leading, 2)
        }
    }
    let user: Experience
    let isLog: Bool
    
    var body: some View {
        VStack {
            infos(imageName: "mappin", description: "  Paris, France")
            infos(imageName: "speaker.wave.2", description: user.author.spokenLanguages)
            if isLog {
                infos(imageName: "latch.2.case", description: user.category.specialisation)
            }
        }
//        .frame(maxWidth: .infinity)
//        .frame(maxHeight: 100)
    }
}

struct InfosProfileView2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfosProfileView2(user: MOCK_EXPERIENCES[0], isLog: false)
                .previewLayout(.sizeThatFits)
        }
    }
}
