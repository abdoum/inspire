//
//  MapView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var showDetails: Experience? = nil
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8013, longitude:  2.6076), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: MOCK_EXPERIENCES, annotationContent: { experience in
                MapAnnotation(coordinate: experience.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            showDetails = experience
                        }
                    }) {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 60.0, height: 30.0)
                            .foregroundColor(.white)
                            .overlay(
                                Text("\(experience.price)€")
                                    .font(.subheadline)
                                    .foregroundColor(.black))
                    }
                    .shadow(color: .gray, radius: 10)
                }
            }).onTapGesture {
                showDetails = nil
            }
            if let experience = showDetails {
                PopupHomepage(experience: experience)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(FavorisManager())
    }
}
