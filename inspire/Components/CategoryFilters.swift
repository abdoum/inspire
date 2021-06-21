//
//  filterTag.swift
//  inspire
//
//  Created by ab on 10/06/2021.
//
// Abdallah :)
// Giovanni :p

// Yves 12:34
// 1234567890


import SwiftUI

struct FilterTag {
    var text : String
    var isSelected : Bool
}

var exempleTag = FilterTag(text: "En visio", isSelected: false)

struct CategoryFilters: View {
    @Binding var tag : FilterTag
    
    var body: some View {
        HStack {
            Button(action: {
                tag.isSelected.toggle()
            }, label: {
                HStack{
                    if tag.isSelected {
                        Image(systemName: "xmark")
                    }
                    // MARK: tag text
                    Text(exempleTag.text)
                        .tracking(0.2)
                }
                .padding(tag.isSelected ? 6 : 12)
                .background(Color(tag.isSelected ? #colorLiteral(red: 0.2666666805744171, green: 0.2666666805744171, blue: 0.2666666805744171, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(tag.isSelected ? 6 : 25)
                .foregroundColor(Color(tag.isSelected ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.2666666805744171, green: 0.2666666805744171, blue: 0.2666666805744171, alpha: 1)))
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color(tag.isSelected ? .clear : #colorLiteral(red: 0.8941176533699036, green: 0.8941176533699036, blue: 0.8941176533699036, alpha: 1)), lineWidth: tag.isSelected ? 0 : 1)
                )
            })
        }
        .font(.system(size: 10, weight: .medium))
    }
}

//struct filterTag_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryFilter(label: experiencesCategories)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
