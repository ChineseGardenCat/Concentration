//
//  ViewController.swift
//  Concentration
//
//  Created by MATTEW MA on 7/9/18.
//  Copyright © 2018 Mathhew Workshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int{
        return (cardButtons.count + 1) / 2
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    private(set) var flipCount: Int = 0{
        didSet{
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("Choosen card not in the array!")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    private var emojiArray = ["👻","🎃","🤩","🤬","👽","💩","🤑","👹"]
    
    private var emojiDict = [Int : String]()
    
    private func emoji(for card: Card) -> String {
        if emojiDict[card.identifier] == nil{
            if emojiArray.count > 0{
                emojiDict[card.identifier] = emojiArray.remove(at: emojiArray.count.randomInt)
            }
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
}

extension Int{
    var randomInt: Int{
        if self>0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self<0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}

