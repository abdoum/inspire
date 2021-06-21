//
//  MapView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 18/06/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var searchText = ""
    @State private var inSearchmode = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8013, longitude:  2.6076), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State private var tag = FilterTag(text: "", isSelected: false)
     var places: [Location] = [
        Location(coordinate: CLLocationCoordinate2D(latitude: 48.8548, longitude:  2.6287))
    ]
    
    var body: some View {
        VStack  (alignment: .leading) {
            SearchView(searchText: $searchText, inSearchmode: $inSearchmode)
                .padding(.trailing).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(experiencesCategories, id: \.self) { experience in
                        
                        CategoryFilters(tag: $tag)
                            .padding(.leading).padding(.top, 6)
                    }
                }
            }
//            CategoryFilters()
//                .padding(.leading).padding(.top, 5)
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
        MapView()
    }
}
