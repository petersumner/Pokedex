//
//  Pokemon.swift
//  Pokedex
//
//  Created by Peter Sumner on 11/8/20.
//  Copyright © 2020 Peter Sumner. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
}
