//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jackiossy on 2022/7/14.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game_viewmodel: EmojiMemoryGame
    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(game_viewmodel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                game_viewmodel.choose(card)
                            }
                    }
                }
            }
        }
        .foregroundColor(.red)
        .padding()
    }
}

struct CardView: View {
    // 定义Card类型的card变量, 用于传递卡片
    // 视图的数据传递应遵循最小原则
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.conerRadius)
                if card.isFaceUp {
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                }else if card.isMatched {
                    //卡片匹配完成, 讲卡片消失掉
                    //opacity 透明度0为完全透明
                    shape.opacity(DrawingConstants.shape_opacity)
                }else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let conerRadius = 20.00
        static let lineWidth = 3.0
        static let fontScale = 0.75
        static let shape_opacity = 0.0
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game_viewmodel: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
        EmojiMemoryGameView(game_viewmodel: game)
            .preferredColorScheme(.dark)
    }
}
