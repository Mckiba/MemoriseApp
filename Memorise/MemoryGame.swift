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
    private(set) var cards: Array<Card>
    var score: Int
    
    
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
        score = 0;
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
                    isMatched(isMatched: true)
                }
                self.cards[chosenIndex].isFaceUp = true
            }else{
                
                indexOfChosenFaceUpCard = chosenIndex
                
            }
        }
    }
    
    
    mutating func isMatched(isMatched: Bool) {isMatched ? (score += 2) : (score -= 1)}
    
    
    struct Card: Identifiable {
        var Content: CardContent
        var id: Int
        
        
        var isFaceUp: Bool = false{
            
            didSet {
                
                if isFaceUp {
                    stopUsingBonusTime()
                }
                else{
                    stopUsingBonusTime()
                }
            }
            
        }
        
        
        
        var isMatched = false {
            didSet {
                
                stopUsingBonusTime()
            }
        }
        
        //Mark: - Bonus Time
        //This could give matching bonus points
        //if the user matches the card
        //before a certain amount of time passes during which the card is face up
        
        //can be zero which means no bonus avilable for this card
        var bonusTimeLimit: TimeInterval = 6
        
        
        //how long this card has ever been face up
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        //the last time the card  was turned up and is still face up
        var lastFaceUpDate: Date?
        
        
        //accumulated time this card has been face up
        var pastFaceUpTime: TimeInterval = 0
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        //percentage of bonus remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        //wether the card was matched during the bonus time
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        //called when the card transitions to face up state
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        //called when the card goes back face down (or gets matched)
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            lastFaceUpDate = nil
        }
    }
    
    
    
    
    
    
    
    
    
    
}


