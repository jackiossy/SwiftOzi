//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jackiossy on 2022/7/15.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    // set关键字用于保护卡片, 外部可以读取 调用卡片, 但是无法修改卡片
    private(set) var cards: Array<Card>
    
    // 当有一个卡片向上的时候, 开始游戏 匹配卡片
    //由于此变量是完全在 MemoryGame 结构体中内部使用, 所以并不需要用set关键字暴露给外部调用
    //引入计算属性, 使程序更加的稳定
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            }else {
                return nil
            }
        }
        
        set {
            
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            }else {
                //没有匹配项, 或 没有一张卡片是向上的, 那么将所有卡片背面向上
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                //设置存储翻转的第一张牌
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            //点击即可翻牌
            cards[chosenIndex].isFaceUp.toggle()
        }
        print(cards)
    }
    

    
    init(numberOfPairsOfCards: Int, creatCardContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = creatCardContent(pairIndex)
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))

        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
