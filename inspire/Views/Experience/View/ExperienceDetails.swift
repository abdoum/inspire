//
//  ExperienceDetails.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceDetails: View {
    
    // Var duration: Timer
    // var price: Double = 100
    //var currency: String = "Euros"
    //   var category: ExperienceCategories
    //   var mode: Session.ParticipationMode
    //var title: String = "Sculpture"
    //var description: String = "zzffz"
    //   var creationDate: Date =
    //   var reviews: [Review]
    //   var rateAverage: avg(reviews.rate)
    //var isFavorite: Bool = true
    // var location: CLLocationCoordinate2D
    // var author: User
    // var guest: [User]
    // var photos: [String]
    //  var videos: [String]
    //var imageCover: String = "image" //photos[0]
    //  var sessions: [Session]
    //var prerequisites: [String] = ["dsfgdf"]
    //  var accumulatedReservations: sum(sessions.guests)
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Image("SculpteurSurPierre")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .listRowInsets(EdgeInsets())
                    AuthorMainInfos()
                        .listRowInsets(EdgeInsets())
                    ExperienceContact()
                    ExperienceProgram()
                    UserNeeds()
                    
                    ExperienceReviews()
                }
                ExperiencePriceDates()
                
            }
            VStack {
                HStack {
                    Button(action: {}) {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                        }.font(.system(size: 30))
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {}) {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Image(systemName: "paperplane.circle.fill")
                                .foregroundColor(.white)
                        }.font(.system(size: 30))
                    }
                    .padding()
                    
                    Button(action: {}) {
                        ZStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                                .opacity(0.8)
                                .font(.system(size: 18))
                        }
                    }
                    .padding()
                }
                .padding(.top,40)
                Spacer()
            }
        } .edgesIgnoringSafeArea(.all)
    }
    
}

struct ExperienceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetails()
    }
}
