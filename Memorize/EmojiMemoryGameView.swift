//
//  ContentView.swift
//  Memorize
//
//  Created by Christian Perez on 8/17/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    private let aspectRatio : CGFloat = 2/3
    @ObservedObject var viewModel : EmojiMemoryGame
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
            }

        }
        .padding()
    }
    var cards : some View {
        AspectVGrid(items: viewModel.cards.filter({!$0.isMatched }), aspectRatio: aspectRatio) { card in
                CardView(card)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
                }
                .foregroundColor(.orange)
    }
    
    
        
}

struct CardView : View {
    //Some comment
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    let card : MemoryGame<String>.Card
    var body : some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.opacity(card.isFaceUp ? 0 : 1)
        }
        
    }
}


























struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
