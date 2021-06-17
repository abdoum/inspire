//
//  Title.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI
import Combine

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

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    @State private var isRedacted: Bool = true
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height:100)
                .clipShape(Circle())
                .redacted(reason:  isRedacted ? .placeholder : .init())
                .onReceive(imageLoader.didChange) { data in
                    isRedacted = false
                self.image = UIImage(data: data) ?? UIImage()
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
            ImageView(withURL: "https://i.pravatar.cc/100?img=1")
        }.previewLayout(.sizeThatFits)
    }
}
