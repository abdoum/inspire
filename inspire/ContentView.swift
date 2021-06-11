//
//  ContentView.swift
//  inspire
//
//  Created by ab on 10/06/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
  

    var body: some View {
       Text("hello")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
