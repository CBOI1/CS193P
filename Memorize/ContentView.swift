//
//  ContentView.swift
//  Memorize
//
//  Created by Christian Perez on 8/17/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👾", "🤖", "👻", "🤡", "🦭"]
    @State var cardCount = 2
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjuster
        }
        .padding()
    }
    var cards : some View {
        LazyVGrid(columns: [GridItem(), GridItem()]){
            ForEach(0..<cardCount, id: \.self) {
                CardView(content: emojis[$0], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    func cardAdjuster(by offset : Int, symbol : String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
    
    var cardAdjuster : some View {
        HStack {
            cardAdjuster(by: -1, symbol: "minus.circle")
            Spacer()
            cardAdjuster(by: +1, symbol: "plus.circle")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}


struct CardView : View {
    //Some comment
    
    let content : String
    @State var isFaceUp : Bool = false
    var body : some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 10)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}


























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
