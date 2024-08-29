//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Christian Perez on 8/17/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
