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
        
        
        
        let emoji = theme.emojis.shuffled
        let numberOfPairsOfCards = theme.numberOfPairs ?? Int.random(in: 3...6)
        
        return MemoryGame<String>(numberOfPairOfCards: numberOfPairsOfCards) {emoji()[$0]}
        
        
    }
    
    //Mark: - Acces to Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {model.score}
    
    
    //Mark: -Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame(){
        
        let currentTheme = theme
        var nextTheme : Theme
        
        repeat{
            nextTheme = themes.randomElement()!
        }while nextTheme.id == currentTheme.id
        
        theme = nextTheme
        model = EmojiMemoryGame.createMemoryGame(theme: nextTheme)
        
    }
}

