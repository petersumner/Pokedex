//
//  Move.swift
//  Pokedex
//
//  Created by Peter Sumner on 2/7/21.
//  Copyright © 2021 Peter Sumner. All rights reserved.
//

import Foundation

class Move {
    
    var name = ""
    var type = ""
    var category = ""
    var power = 0
    var accuracy = 0
    var pp = 0
    
    init(name: String, type: String, category: String, power: Int, accuracy: Int, pp: Int) {
        self.name = name.capitalized
        self.type = type
        self.category = category
        self.power = power
        self.accuracy = accuracy
        self.pp = pp
    }
}
