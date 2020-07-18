//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Mckiba Williams on 5/29/20.
//  Copyright © 2020 McKiba Williams. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    
     private(set) var theme = themes.randomElement()!
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
        
    private static func createMemoryGame(theme: Theme) -> (MemoryGame<String>) {
        
        //let emojis: Array<String> = ["🤥","🥵","💀","😜","🥺","😳"].shuffled()
        let emoji = theme.emojis.shuffled
        let numberOfPairsOfCards = theme.numberOfPairs ?? Int.random(in: 3...5)
        
        return MemoryGame<String>(numberOfPairOfCards: numberOfPairsOfCards) {emoji()[$0]}
        
        
    }
    
    
    /* static func returnTheme() -> Array<String> {
     let flags: Array<String> = ["🇨🇰","🇦🇿","🇨🇴"].shuffled()
     let emojis: Array<String> = ["🤥","🥵","💀","😜","🥺","😳"].shuffled()
     return emojis
     }*/
    
    
    
    //Mark: - Acces to Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    //Mark: -Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        
        model.choose(card: card)
        
    }
}

