//
//  MemoryGame.swift
//  Memorise
//
//  Created by Mckiba Williams on 5/29/20.
//  Copyright © 2020 McKiba Williams. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var pairNumber: Int
    var cards: Array<Card>
    var indexOfChosenFaceUpCard: Int? {
        
        get{ cards.indices.filter { (cards[$0].isFaceUp) }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
                
            }
            
        }
    }
    
    init(numberOfPairOfCards: Int  , cardContentFactory : (Int) -> CardContent) {
        cards = Array<Card>()
        pairNumber = Int.random(in: 2...5)
        for pairIndex in 0..<numberOfPairOfCards{
            
            cards.shuffle()
            let content = cardContentFactory(pairIndex)
            cards.append(Card( Content: content ,id: pairIndex * 2))
            cards.append(Card( Content: content, id: pairIndex * 2+1))
            
        }
        
        
    }
    
    mutating func choose(card: Card) {
        print("Card chosen:  \(card)")
        if let chosenIndex = cards.firstIndex(matching: card) ,!cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatch = indexOfChosenFaceUpCard {
                if cards[chosenIndex].Content == cards[potentialMatch].Content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                }
                indexOfChosenFaceUpCard = nil
            }else{
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfChosenFaceUpCard = chosenIndex
                
            }
            self.cards[chosenIndex].isFaceUp = true
        }
    }
    
    /*  func index(of: Card) -> Int {
     for index in 0..<cards.count {
     if self.cards[index].id == of.id{
     return index
     }
     }
     return 0 //TODO: BOGUS
     
     }
     */
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var Content: CardContent
        var id: Int
    }
}


