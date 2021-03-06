//
//  ContentView.swift
//  inspire
//
//  Created by ab on 10/06/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
   
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Utilisateur.timestamp, ascending: true)],
        animation: .default)
    private var utilisateurs: FetchedResults<Utilisateur>
    
    
    var body: some View {
        VStack {
            List {
                ForEach(utilisateurs) { utilisateur in
                    Text("Utilisateur at \(utilisateur.timestamp!, formatter: utilisateurFormatter)")
                }
                .onDelete(perform: deleteUtilisateurs)
            }
            Button(action: addUtilisateur) {
                Label("Add Utilisateur", systemImage: "plus")
            }
        }
       
       
//            Text("content view *do not remove this file*")
       
    }
    
    private func addUtilisateur() {
        withAnimation {
            let newUtilisateur = Utilisateur(context: viewContext)
            newUtilisateur.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteUtilisateurs(offsets: IndexSet) {
        withAnimation {
            offsets.map { utilisateurs[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let utilisateurFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


//import SwiftUI
//import CoreData
//
//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @StateObject var quiz = Quiz()
//    @StateObject var experiences = SharedExperiences()
//    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//    
//    
//    var body: some View {
////        List {
////            ForEach(items) { item in
////                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
////            }
////            .onDelete(perform: deleteItems)
////        }
////        .toolbar {
////            #if os(iOS)
////            EditButton()
////            #endif
////
////            Button(action: addItem) {
////                Label("Add Item", systemImage: "plus")
////            }
////        }
//       
////        ExperienceDetails()
//       
//    }
//    
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//    
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
