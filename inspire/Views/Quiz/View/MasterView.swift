//
//  MasterView.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct MasterView: View {
    
    @EnvironmentObject var quiz : Quiz
    @State private var badgeCount: Int = 1
    var badgePosition: CGFloat = 2
    var tabsCount: CGFloat = 4
    @EnvironmentObject var favorisManager : FavorisManager
    
    var body: some View {
        
        if quiz.params.isPresented {
            Flow()
        }else{
            GeometryReader { geometry in
                ZStack(alignment: .bottomLeading) {
                    TabView {
                        ExplorerView()
                            .tabItem { Image(systemName: "rectangle.stack.person.crop.fill")
                                Text("Explorer").fontWeight(.bold)
                            }
                        FavorisView(experience: MOCK_EXPERIENCES)
                            .tabItem { Image(systemName: "heart")
                                Text("Favoris").fontWeight(.bold)
                            }
                        
                        UserHistoryView()
                            .tabItem { Image(systemName: "face.dashed.fill")
                                Text("Expériences").fontWeight(.bold)
                            }
                        MasterLogin()
                            .tabItem { Image(systemName: "person.crop.circle.fill")
                                Text("Compte").fontWeight(.bold)
                            }
                    }.accentColor(.customPrimary)
                    // Badge View
                    if favorisManager.favoris.count > 0 {
                        ZStack {
                            Circle()
                                .foregroundColor(.customPrimary)
                            
                            Text("\(favorisManager.favoris.count)")
                                .foregroundColor(.white)
                                .font(Font.system(size: 12))
                        }
                        .frame(width: 15, height: 15)
                        .offset(x: ( ( 2 * self.badgePosition) - 0.95 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ) + 2, y: -25)
                        .opacity(1 == 0 ? 0 : 1.0)
                    }
                }
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        
        MasterView()
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
            .environmentObject(FavorisManager())
            .environmentObject(ImageLoader(urlString: ""))
    }
}
