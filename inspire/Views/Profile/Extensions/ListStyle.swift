//
//  ListStyle.swift
//  inspire
//
//  Created by Jonathan Duong on 15/06/2021.
//

import SwiftUI

extension View {
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}
