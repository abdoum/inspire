//
//  Extension.swift
//  inspire
//
//  Created by Jonathan Duong on 16/06/2021.
//

import UIKit

extension UIApplication {
    // permet de fermer le clavier si Cancel
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
