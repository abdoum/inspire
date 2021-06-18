//
//  MapView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8013, longitude:  2.6076), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
     var places: [Location] = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 48.8548, longitude:  2.6287))
    ]
    let categoryArray: [String] = [
        "Artisanat", "Cuisine", "Informatique", "Ostéopathe"
    ]
    @Binding var showMap: Bool
    
    var body: some View {
        VStack  (alignment: .leading) {
            SearchView()
                .padding(.trailing).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryArray, id: \.self) { _ in
                        CategoryFilter()
                            .padding(.leading).padding(.top, 6)
                    }
                }
            }
            CategoryFilter()
                .padding(.leading).padding(.top, 5)
            Divider().padding(.top)
            Map(coordinateRegion: $region, annotationItems: places, annotationContent: { place in
                MapPin(coordinate: place.coordinate)
            }).frame(height: 590)
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView( showMap: .constant(false))
    }
}
