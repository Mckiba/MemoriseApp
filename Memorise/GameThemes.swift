//
//  GameThemes.swift
//  Memorise
//
//  Created by McKiba Williams on 7/16/20.
//  Copyright © 2020 McKiba Williams. All rights reserved.
//

import Foundation
import SwiftUI




let themes: [Theme] = [
    
    Theme(
        themeName: "Flags",
        emojis: ["🇬🇧", "🇺🇸", "🇹🇷", "🇨🇦", "🇯🇵", "🇳🇴", "🇧🇪", "🇷🇺","🇯🇲"],
        themColor: .orange,
        numberOfPairs: 4,
        
        id: 0
    )
    ,
    
    Theme(
        themeName: "Fruits",
        emojis: ["🍆", "🍑", "🌽", "🍕", "🍎", "🧀","🥓","🍖","🌭"],
        themColor: .pink,
        numberOfPairs: 5,
        
        id: 0
    ),
    
    Theme(
        themeName: "Halloween",
        emojis: ["👻", "🎃", "🙀", "😈", "☠️", "💀", "🦇", "🍭", "🕸"],
        themColor: .orange,
        numberOfPairs: nil,
        id: 2
    ),
    
    Theme(
        themeName: "Vehicles",
        emojis: ["🚗", "🚕", "🏎", "🚜", "🚚", "🚆", "🚊", "🛩", "🚀"],
        themColor: .orange,
        numberOfPairs: 3,
        id: 4
    ),
    
    Theme(
        themeName: "Faces",
        emojis: ["😅","🤓", "😎", "🥺", "🤬", "🤯", "🥶","😜", "😷"],
        themColor: .yellow,
        numberOfPairs: 3,
        id: 5
    ),
]

struct Theme: Identifiable {
    
    let themeName: String
    let emojis: [String]
    let themColor: Color
    let numberOfPairs: Int?
    let id : Int
    
    
}
