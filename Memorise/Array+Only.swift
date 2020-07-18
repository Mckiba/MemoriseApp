//
//  Array+Only.swift
//  Memorise
//
//  Created by McKiba Williams on 6/23/20.
//  Copyright © 2020 McKiba Williams. All rights reserved.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
    
}
