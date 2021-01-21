//
//  Pokemon.swift
//  Pokedex
//
//  Created by Peter Sumner on 11/8/20.
//  Copyright © 2020 Peter Sumner. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _primaryType: String!
    private var _secondaryType: String!
    private var _height: String!
    private var _weight: String!
    private var _hp: String!
    private var _attack: String!
    private var _defense: String!
    private var _spatk: String!
    private var _spdef: String!
    private var _speed: String!
    private var _evoTxt: String!
    private var _pokemonURL: String!

    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var primaryType: String {
        if _primaryType == nil {
            _primaryType = ""
        }
        return _primaryType
    }
    
    var secondaryType: String {
        if _secondaryType == nil {
            _secondaryType = ""
        }
        return _secondaryType
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var hp: String {
        if _hp == nil {
            _hp = ""
        }
        return _hp
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var spatk: String {
        if _spatk == nil {
            _spatk = ""
        }
        return _spatk
    }
    
    var spdef: String {
        if _spdef == nil {
            _spdef = ""
        }
        return _spdef
    }
    
    var speed: String {
        if _speed == nil {
            _speed = ""
        }
        return _speed
    }
    
    var evoTxt: String {
        if _evoTxt == nil {
            _evoTxt = ""
        }
        return _evoTxt
    }
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name.capitalized
        self._pokedexID = pokedexID
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexID)/"
    }
    
    func downloadPokemonDetail(completed: DownloadComplete) {
        AF.request(_pokemonURL).responseJSON { (response) in
            if let dict = response.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                if let stats = dict["stats"] as? Array<Any> {
                    if let hp = stats[0] as? Dictionary<String, AnyObject> {
                        self._hp = "\(String(describing: hp["base_stat"] as! Int))"
                    }
                    if let attack = stats[1] as? Dictionary<String, AnyObject> {
                        self._attack = "\(String(describing: attack["base_stat"] as! Int))"
                    }
                    if let defense = stats[2] as? Dictionary<String, AnyObject> {
                        self._defense = "\(String(describing: defense["base_stat"] as! Int))"
                    }
                    if let spatk = stats[3] as? Dictionary<String, AnyObject> {
                        self._spatk = "\(String(describing: spatk["base_stat"] as! Int))"
                    }
                    if let spdef = stats[4] as? Dictionary<String, AnyObject> {
                        self._spdef = "\(String(describing: spdef["base_stat"] as! Int))"
                    }
                    if let speed = stats[5] as? Dictionary<String, AnyObject> {
                        self._speed = "\(String(describing: speed["base_stat"] as! Int))"
                    }
                }
                if let types = dict["types"] as? Array<Any> {
                    if let primaryDict = types[0] as? Dictionary<String, AnyObject> {
                        if let type = primaryDict["type"] as? Dictionary<String, AnyObject> {
                            self._primaryType = type["name"] as? String
                        }
                    }
                    if types.count > 1 {
                        if let secondaryDict = types[1] as? Dictionary<String, AnyObject> {
                            if let type = secondaryDict["type"] as? Dictionary<String, AnyObject> {
                                self._secondaryType = type["name"] as? String
                            }
                        }
                    } else {
                        self._secondaryType = nil
                    }
                }
                if let id = dict["id"] as? Int {
                    self._pokedexID = id
                }
            }
        }
    }
}
