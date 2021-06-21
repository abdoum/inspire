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
    @State private var searchText = ""
    @State private var inSearchmode = false
    @State private var tag = FilterTag(text: "", isSelected: false)
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8013, longitude:  2.6076), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    var experience: Experience
    let annotations = MOCK_EXPERIENCES
    
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
            //            , interactionModes: .all, showsUserLocation: true, userTrackingMode: .none
            Divider().padding(.top)
            Map(coordinateRegion: $region, annotationItems: annotations) {
                MapAnnotation(coordinate: $0.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                    Button(action: {
                        //code...
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 60.0, height: 30.0)
                                .foregroundColor(.white)
                            
                            Text("\(experience.price.description) €")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    .shadow(color: .gray, radius: 10)
                }
            }
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(experience: MOCK_EXPERIENCES[0])
    }
}
