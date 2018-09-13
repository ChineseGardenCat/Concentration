//
//  Card.swift
//  Concentration
//
//  Created by MATTEW MA on 14/9/18.
//  Copyright © 2018 Mathhew Workshop. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getAUniqueIdentifier() -> Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init() {
        self.identifier = Card.getAUniqueIdentifier()
        //TODO add more functions to cards
    }
    
    
}
