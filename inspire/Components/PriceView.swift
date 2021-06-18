//
//  PriceView.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct PriceView: View {
    let price : Double
    let color : Color
    var body: some View {
        HStack {
            Text(priceFormatter(price))
                .font(.callout)
                .fontWeight(.heavy)
                .foregroundColor(color)
        }
    }
    func priceFormatter(_ price : Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "fr")
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        return formatter.string(from: NSNumber(value: price)) ?? String(price)
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: 30, color: .gray)
            .previewLayout(.sizeThatFits)
    }
}
