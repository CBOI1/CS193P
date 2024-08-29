//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Christian Perez on 8/24/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    private(set) var cards : [Card]
    var oneAndOnlyFaceUpCardIndex : Int? {
        get {
            let faceUpIndices = cards.indices.filter { cards[$0].isFaceUp}
            return (faceUpIndices.count == 1 ? faceUpIndices.first : nil)
        }
        set(chosenIndex) {
            cards.indices.forEach { 
                cards[$0].isFaceUp = (chosenIndex == $0)
            }
        }
    }
    init(numberOfPairsOfCards : Int, cardContentFactory : (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let matchIndex = oneAndOnlyFaceUpCardIndex {
                    if cards[matchIndex].content == cards[chosenIndex].content {
                        cards[matchIndex].isMatched = true
                        cards[chosenIndex].isMatched = true
                    }
                } else {
                    oneAndOnlyFaceUpCardIndex = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content : CardContent
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        
        var id: String
    }
}
