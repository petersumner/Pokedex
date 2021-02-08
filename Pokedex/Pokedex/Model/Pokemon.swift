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
    var height = 0.0
    var weight = 0.0
    var stats = [Int]()
    var abilities = [String]()
    var pokemonURL = ""
    var baseExp = 0
    var weak = [String]()
    var resist = [String]()
    var immune = [String]()
    var moves = [Move]()
    
    init(name: String, pokedexID: Int) {
        self.name = name.capitalized
        self.pokedexID = pokedexID
        self.pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokedexID)/"
    }
        
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        AF.request(pokemonURL).responseJSON { (response) in
            guard let data = response.data else { return }
            do {
                let json = try JSON(data: data)
                self.weight = json["weight"].double! / 10
                self.height = json["height"].double! / 10
                self.baseExp = json["base_experience"].int!
                let abilities = json["abilities"].array!
                for slot in abilities {
                    let ability = slot["ability"].dictionary!
                    self.abilities.append((ability["name"]?.string!)!)
                }
                let types = json["types"].array!
                for slot in types {
                    let type = slot["type"].dictionary!
                    if !self.types.contains((type["name"]?.string!)!) {
                        self.types.append((type["name"]?.string!)!)
                    }
                }
                if self.types.count > 1 && self.types[0] == self.types[1] {
                    self.types.remove(at: 1)
                }
                let stats = json["stats"].array!
                for slot in stats {
                    self.stats.append(slot["base_stat"].int!)
                }
            } catch {
                print(error)
            }
            completed()
        }
    }
}
