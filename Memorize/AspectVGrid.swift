//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Christian Perez on 8/29/24.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where Item : Identifiable, ItemView : View {
    var items : [Item]
    var aspectRatio : CGFloat = 1
    var content : (Item) -> ItemView
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(count: items.count, size: geometry.size, aspectRatio: aspectRatio)
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)],
                spacing: 0) {
                    ForEach(items) { item in 
                        content(item)
                            .aspectRatio(aspectRatio, contentMode: .fit)
                    }
            }
        }
    }
    
    func gridItemWidthThatFits(count: Int, size: CGSize, aspectRatio : CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        print("width: \(size.width) height:\(size.height)")
        repeat {
            let cardWidth = size.width / columnCount
            let cardHeight = cardWidth / aspectRatio
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * cardHeight < size.height {
                return (size.width / columnCount).rounded(.down)
            }
            print("card width \(cardWidth)")
            print("card height \(cardHeight)")
            columnCount += 1
        } while columnCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

