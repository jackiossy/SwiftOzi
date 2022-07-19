//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jackiossy on 2022/7/14.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game_viewmodel: game)
        }
    }
}
