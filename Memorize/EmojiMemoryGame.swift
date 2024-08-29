//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Christian Perez on 8/24/24.
//

import SwiftUI


class EmojiMemoryGame : ObservableObject{
    static let emojis = ["👾", "🤖", "👻", "🤡", "🦭", "🐻", "🐶", "🐼", "🦁", "🦆", "🐷", "🐴"]
    @Published private var model = createMemoryGame()
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 7) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "❓"
            }
        }
    }
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    //MARK: Intent
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    func shuffle() {
        model.shuffle()
    }
}
