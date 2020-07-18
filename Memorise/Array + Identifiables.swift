//
//  Array + Identifiables.swift
//  Memorise
//
//  Created by McKiba Williams on 6/23/20.
//  Copyright © 2020 McKiba Williams. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    
    func firstIndex(matching: Element ) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
    
    
}
