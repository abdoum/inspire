//
//  Keyboard+.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import UIKit

extension UIApplication {
    // permet de fermer le clavier si Cancel
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
