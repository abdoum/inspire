//
//  ButtonStyle.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

protocol ButtonConnexionViewStyle {
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
}

// On peut creer autant de style que l'on veut, avec un nom approprier
struct ButtonConnexionViewStyleBlack: ButtonConnexionViewStyle {
    let foregroundColor: Color = .white
    let backgroundColor: Color = .black
}

// Custom view modifier
extension View {
    func buttonConnexionViewStyle(style: ButtonConnexionViewStyle) -> some View {
        modifier(ButtonConnexionViewModifier(style: style))
    }
}
struct ButtonConnexionViewModifier: ViewModifier {
    let style: ButtonConnexionViewStyle
    func body(content: Content) -> some View {
        // ici on met les shape et padding ou frame plutot que dans le button lui meme.
        // on pourrait meme definir la shape que l'on veut dans le l'object style //ex: Capsule, Rectangle, Circle etc...
        content
            .foregroundColor(style.foregroundColor)
//            .frame(width: 150, height: 50, alignment: .center)
            .background(style.backgroundColor)
            .clipShape(Capsule())
    }
}
