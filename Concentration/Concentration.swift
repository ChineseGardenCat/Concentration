//
//  Concentration.swift
//  Concentration
//
//  Created by MATTEW MA on 14/9/18.
//  Copyright © 2018 Mathhew Workshop. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfTheOnlyOneFacingUpCard: Int? {
        get{
//            var foundIndex: Int?
//            for index in cards.indices{
//                if cards[index].isFaceUp{
//                    if foundIndex == nil {
//                        foundIndex = index
//                    }else{
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
            return cards.indices.filter{ cards[$0].isFaceUp }.theOneAndOnly
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards:\(numberOfPairsOfCards)): You need at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
        var cardsShuffled = [Card]()
        
        for _ in 0..<cards.count{
            cardsShuffled.append(cards.remove(at:cards.count.randomInt))
        }
        cards = cardsShuffled
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): Choosen index out of range! ")
        if !cards[index].isMatched{
            if let matchIndex = indexOfTheOnlyOneFacingUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                indexOfTheOnlyOneFacingUpCard = index
            }
        }
    }
}

extension Collection{
    var theOneAndOnly : Element?{
        return count == 1 ? first : nil
    }
}
