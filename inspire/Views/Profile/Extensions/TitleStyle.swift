//
//  TitleStyle.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

protocol TitleViewStyle {
    var foregroundColor: Color { get }
}
struct TitleViewStyleGray: TitleViewStyle {
    let foregroundColor: Color = .gray
}
extension View {
    func titleViewStyle(style: TitleViewStyle) -> some View {
        modifier(TitleViewModifier(style: style))
    }
}
struct TitleViewModifier: ViewModifier {
    let style: TitleViewStyle
    func body(content: Content) -> some View {
        // ici on met les shape et padding ou frame plutot que dans le button lui meme.
        // on pourrait meme definir la shape que l'on veut dans le l'object style //ex: Capsule, Rectangle, Circle etc...
        content
            .foregroundColor(style.foregroundColor)
            .font(.largeTitle)
    }
}
