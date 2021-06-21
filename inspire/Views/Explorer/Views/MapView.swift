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
    @State private var tag = FilterTag(text: "", isSelected: false)
    @StateObject var location: LocationHelper = LocationHelper(CLLocation(latitude: 48.9066, longitude: 2.4522))
    var placeItems: Experience
    
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
//            Map(coordinateRegion: $location.coordinates, interactionModes: .all, showsUserLocation: true, userTrackingMode: .none, annotationItems: placeItems.location) { place in
//                MapAnnotation(coordinate: place.placeItems.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
//                    HomePageMapPin(experience: placeItems.price.description)
//                }
//            }
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(placeItems: MOCK_EXPERIENCES[0])
    }
}
