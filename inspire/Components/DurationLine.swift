//
//  DurationLine.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

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



struct DurationLine_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DurationLine(duration: 7900,  color: .customPrimary)
            DurationLine(duration: 4850,  color: .white)
                .preferredColorScheme(.dark)
           
        }.previewLayout(.sizeThatFits)
    }
}
