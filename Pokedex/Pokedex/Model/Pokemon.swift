//
//  Pokemon.swift
//  Pokedex
//
//  Created by Peter Sumner on 11/8/20.
//  Copyright © 2020 Peter Sumner. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    
    var name = ""
    var pokedexID = 0
    var description = ""
    var types = [String]()
    var height = 0
    var weight = 0
    var stats = [Int](repeating: 0, count: 6)
    var abilities = [String](repeating: "", count: 4)
    var hp = 0
    var attack = 0
    var defense = 0
    var spatk = 0
    var spdef = 0
    var speed = 0
    var evoTxt = 0
    var pokemonURL = ""

    init(name: String, pokedexID: Int) {
        self.name = name.capitalized
        self.pokedexID = pokedexID
        self.pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokedexID)/"
    }
    
    func downloadPokemonDetail(completed: DownloadComplete) {
        
        AF.request(pokemonURL).responseJSON { (json) in
            print(json)
        }
        completed()
    }
//        AF.request(_pokemonURL).responseJSON { (response) in
//            if let dict = response.value as? Dictionary<String, AnyObject> {
//                if let weight = dict["weight"] as? Int {
//                    self._weight = "\(weight)"
//                }
//                if let height = dict["height"] as? Int {
//                    self._height = "\(height)"
//                }
//                if let stats = dict["stats"] as? Array<Any> {
//                    if let hp = stats[0] as? Dictionary<String, AnyObject> {
//                        self._hp = "\(String(describing: hp["base_stat"] as! Int))"
//                    }
//                    if let attack = stats[1] as? Dictionary<String, AnyObject> {
//                        self._attack = "\(String(describing: attack["base_stat"] as! Int))"
//                    }
//                    if let defense = stats[2] as? Dictionary<String, AnyObject> {
//                        self._defense = "\(defense["base_stat"] ?? "" as AnyObject)"
//                    }
//                    if let spatk = stats[3] as? Dictionary<String, AnyObject> {
//                        self._spatk = "\(String(describing: spatk["base_stat"] as! Int))"
//                    }
//                    if let spdef = stats[4] as? Dictionary<String, AnyObject> {
//                        self._spdef = "\(String(describing: spdef["base_stat"] as! Int))"
//                    }
//                    if let speed = stats[5] as? Dictionary<String, AnyObject> {
//                        self._speed = "\(String(describing: speed["base_stat"] as! Int))"
//                    }
//                }
//                if let types = dict["types"] as? Array<Any> {
//                    if let primaryDict = types[0] as? Dictionary<String, AnyObject> {
//                        if let type = primaryDict["type"] as? Dictionary<String, String> {
//                            self._primaryType = type["name"]
//                        }
//                    }
//                    if types.count > 1 {
//                        if let secondaryDict = types[1] as? Dictionary<String, Dictionary<String, String>> {
//                            if let type = secondaryDict["type"] {
//                                self._secondaryType = type["name"]
//                            }
//                        }
//                    } else {
//                        self._secondaryType = nil
//                    }
//                }
//                if let id = dict["id"] as? Int {
//                    self._pokedexID = id
//                }
//            }
//            print(self._attack)
//
//        }
//        completed()
}
