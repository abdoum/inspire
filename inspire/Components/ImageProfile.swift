//
//  ImageProfile.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI
import Combine

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

struct ImageProfile: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
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
                image = UIImage(data: data) ?? UIImage()
            }
    }
}

struct ImageProfileView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100, height:100)
            .clipShape(Circle())
    }
}

struct ImageProfile_Previews: PreviewProvider {
    static var previews: some View {
        ImageProfile(withURL: "")
    }
}
