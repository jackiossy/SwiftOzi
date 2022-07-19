//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jackiossy on 2022/7/15.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    //给memorygame card 起一个别名, 使得后面的代码更加的简洁
    typealias Card = MemoryGame<String>.Card
    typealias ArrayCard = Array<MemoryGame<String>.Card>
    
    private static let emojis = ["🚗","🚕","🚙","🚌","🏎","🚑","🚜","🚓","🚒","🛻","🚛","🛴","🚲","🚔","✈️","🛫","🛩","🚀"]
    
    private static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in EmojiMemoryGame.emojis[pairIndex]}
    }
    
    
    @Published private var model = EmojiMemoryGame.creatMemoryGame()
    
    var cards: ArrayCard {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
