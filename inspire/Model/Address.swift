//
//  Address.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import Foundation

struct Address {
    var street : String?
    var city : String?
    var zipCode : String?
    var state : String?
    var country : String?
}

var MOCK_ADDRESSES = [
    Address(street: "0350 Continental Pass", city: "Saint-Amand-les-Eaux", zipCode: "59734 CEDEX", state: "Nord-Pas-de-Calais", country: "FR"),
    Address(street: "78779 Mallard Pass", city: "Reims", zipCode: "51715 CEDEX", state: "Champagne-Ardenne", country: "FR"),
    Address(street: "9716 Calypso Circle", city: "Nice", zipCode: "06182 CEDEX 2", state: "Provence-Alpes-Côte d'Azur", country: "FR"),
    Address(street: "473 Larry Junction", city: "Romilly-sur-Seine", zipCode: "10104 CEDEX", state: "Champagne-Ardenne", country: "FR"),
    Address(street: "1150 Vernon Avenue", city: "Xiongguan", zipCode: "", state: "", country: "CN"),
    Address(street: "306 Reinke Court", city: "Montpellier", zipCode: "34032 CEDEX 1", state: "Languedoc-Roussillon", country: "FR")
]
