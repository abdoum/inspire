//
//  Location+.swift
//  inspire
//
//  Created by Jonathan Duong on 21/06/2021.
//

import Foundation
import SwiftUI
import MapKit

class LocationHelper: NSObject, ObservableObject, CLLocationManagerDelegate {
    // ObservableObject parce que aunt on va avoir un changement il va falloir que ce soit répercuté sur notre classe
    // CLLocationManagerDelegate s'occupe de la délégation de ma carte
    // NSObject lorsque l'on utilise un delegate d'une classe hors de UIKit
    
    @Published var coordinates: MKCoordinateRegion
    @Published var shouldTrack = true
    var manager = CLLocationManager()
    var lastUpdatedLocation: CLLocation?
    var span: MKCoordinateSpan
    
// pour pouvoir le montrer il faut init, il faut une position de base. Quant l'User aura validé la position (ou non), pas d'erreur et on pourra tout de même créer la carte par rapport à une position.
    
    init(_ location: CLLocation) {
        span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
        coordinates = MKCoordinateRegion(center: location.coordinate, span: span)
        super.init()
        manager.delegate = self
        start()
    }
    
    func start() {
        // dés l'init il va demander l'autorisation
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: print("Always")
        case .authorizedWhenInUse: print("In Use")
        case .denied: print("Denied")
        case .notDetermined: print("Not Determined")
        case .restricted: print("Restricted")
        
        @unknown default:
            print("Unknow")
        }
    }
    
    // manager.startUpdatingLocation() va appeler des positions, si ça fail , on finit ici
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    // manager.startUpdatingLocation() va appeler des positions, puis on va les positions mise à jour
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastUpdated = locations.last {
            // À quel moment on va vouloir centrer notre carte : 1 si pas de position au départ 0 ou si position non nil mais que l'User permet le tracking
            if((lastUpdatedLocation == nil) || (lastUpdatedLocation != nil && shouldTrack)) {
                center(newLocation: lastUpdated)
            }
            
        }
    }
    
    func center(newLocation: CLLocation) {
        lastUpdatedLocation = newLocation
        coordinates = MKCoordinateRegion(center: newLocation.coordinate, span: span)
    }
}
