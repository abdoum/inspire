//
//  MapButton.swift
//  Inspire5
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI

struct MapButton: View {
    
    @State var showMap: Bool = false
    var body: some View {
        Button (action: {
            showMap.toggle()
        }, label: {
            ZStack {
                Capsule()
                    .frame(width: 120, height: 60)
                    .foregroundColor(.customPrimary)
                HStack {
                    Image(systemName: "map")
                        .foregroundColor(.white)
                        .font(.title)
                    Text("Carte")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title3)
                }
            }
        }).sheet(isPresented: $showMap, content: {
            MapView(showMap: $showMap)
        })
    }
}

struct MapButton_Previews: PreviewProvider {
    static var previews: some View {
        MapButton()
    }
}
