//
//  Title.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct PageTitle: View {
    let content : String
    var body: some View {
        Text(content)
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.customPrimary)
    }
}

struct RatingLine: View {
    let averageRating : Double
    let commentsCount :  Int
    let color : Color
    var body: some View {
        HStack {
            Label(
                title: {
                    Text(String(averageRating))
                        .font(.callout)
                        .fontWeight(.medium)
                    Text("(\(String(commentsCount)))")
                        .font(.callout)
                        .fontWeight(.thin)
                },
                icon: {
                    Image(systemName: "star.fill")
                        .font(.callout)
                }
            ).foregroundColor(color)
        }
    }
}

struct DurationLine: View {
    let duration : TimeInterval
    let color : Color
    var body: some View {
        HStack {
            Label(
                title: {
                    Text(Date(timeInterval: duration, since: Date()) , style: .relative)
                        .font(.callout)
                        .fontWeight(.medium)
                },
                icon: {
                    Image(systemName: "stopwatch.fill")
                        .font(.callout)
                }
            ).foregroundColor(color)
        }
    }
}

func priceFormatter(_ price : Double) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.init(identifier: "fr")
    formatter.numberStyle = .currency
    formatter.currencyCode = "EUR"
    return formatter.string(from: NSNumber(value: price)) ?? String(price)
}
struct Price: View {
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
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PageTitle(content: "Main Page Title example")
            RatingLine(averageRating: 4.89, commentsCount: 328, color: .customPrimary)
            RatingLine(averageRating: 4.89, commentsCount: 328, color: .white)
                .preferredColorScheme(.dark)
            DurationLine(duration: 4850,  color: .customPrimary)
            DurationLine(duration: 4850,  color: .white)
                .preferredColorScheme(.dark)
            Price(price: 75, color: .black)
        }.previewLayout(.sizeThatFits)
    }
}
