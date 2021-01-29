//
//  Constants.swift
//  Pokedex
//
//  Created by Peter Sumner on 1/21/21.
//  Copyright © 2021 Peter Sumner. All rights reserved.
//

import Foundation
import UIKit

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v2/pokemon/"
let URL_TYPE = "/api/v2/type/"

let colors = [
    "normal" : UIColor(red: 0.66, green: 0.65, blue: 0.48, alpha: 1.00),
    "fighting" : UIColor(red: 0.76, green: 0.18, blue: 0.16, alpha: 1.00),
    "flying" : UIColor(red: 0.66, green: 0.56, blue: 0.95, alpha: 1.00),
    "poison" : UIColor(red: 0.64, green: 0.24, blue: 0.63, alpha: 1.00),
    "ground" : UIColor(red: 0.89, green: 0.75, blue: 0.40, alpha: 1.00),
    "rock" : UIColor(red: 0.71, green: 0.63, blue: 0.21, alpha: 1.00),
    "bug" : UIColor(red: 0.65, green: 0.73, blue: 0.10, alpha: 1.00),
    "ghost" : UIColor(red: 0.45, green: 0.34, blue: 0.59, alpha: 1.00),
    "steel" : UIColor(red: 0.72, green: 0.72, blue: 0.81, alpha: 1.00),
    "fire" : UIColor(red: 0.93, green: 0.51, blue: 0.19, alpha: 1.00),
    "water" : UIColor(red: 0.39, green: 0.56, blue: 0.94, alpha: 1.00),
    "grass" : UIColor(red: 0.48, green: 0.78, blue: 0.30, alpha: 1.00),
    "electric" : UIColor(red: 0.97, green: 0.82, blue: 0.17, alpha: 1.00),
    "psychic" : UIColor(red: 0.98, green: 0.33, blue: 0.53, alpha: 1.00),
    "ice" : UIColor(red: 0.59, green: 0.85, blue: 0.84, alpha: 1.00),
    "dragon" : UIColor(red: 0.44, green: 0.21, blue: 0.99, alpha: 1.00),
    "dark" : UIColor(red: 0.44, green: 0.34, blue: 0.27, alpha: 1.00),
    "fairy" : UIColor(red: 0.84, green: 0.52, blue: 0.68, alpha: 1.00)
]

let weaknesses = [
    "normal" : ["fighting"],
    "fighting" : ["flying", "psychic", "fairy"],
    "flying" : ["rock", "electric", "ice"],
    "poison" : ["ground", "psychic"],
    "ground" : ["water", "grass", "ice"],
    "rock" : ["fighting", "ground", "steel", "water", "grass"],
    "bug" : ["flying", "rock", "fire"],
    "ghost" : ["ghost", "dark"],
    "steel" : ["fighting", "ground", "fire"],
    "fire" : ["ground", "rock", "water"],
    "water" : ["grass", "electric"],
    "grass" : ["flying", "poison", "bug", "fire", "ice"],
    "electric" : ["ground"],
    "psychic" : ["bug", "ghost", "dark"],
    "ice" : ["fighting", "rock", "steel", "fire"],
    "dragon" : ["ice", "dragon", "fairy"],
    "dark" : ["fighting", "bug", "fairy"],
    "fairy" : ["poison", "steel"],
]

let resistances = [
    "normal" : [],
    "fighting" : ["rock", "bug", "dark"],
    "flying" : ["fighting", "bug", "grass"],
    "poison" : ["fighting", "poison", "bug", "grass", "fairy"],
    "ground" : ["poison", "rock"],
    "rock" : ["normal", "flying", "poison", "fire"],
    "bug" : ["fighting", "ground", "grass"],
    "ghost" : ["poison", "bug"],
    "steel" : ["normal", "flying", "rock", "bug", "steel", "grass", "psychic", "ice", "dragon", "fairy"],
    "fire" : ["bug", "steel", "fire", "grass", "ice", "fairy"],
    "water" : ["steel", "fire", "water", "ice"],
    "grass" : ["ground", "water", "grass", "electric"],
    "electric" : ["flying", "steel", "electric"],
    "psychic" : ["fighting", "psychic"],
    "ice" : ["ice"],
    "dragon" : ["fire", "water", "grass", "electric"],
    "dark" : ["ghost", "dark"],
    "fairy" : ["fighting", "bug", "dark"],
]

let immunities = [
    "normal" : ["ghost"],
    "fighting" : ["ghost"],
    "flying" : ["ground"],
    "poison" : [],
    "ground" : ["electric"],
    "rock" : [],
    "bug" : [],
    "ghost" : ["normal", "fighting"],
    "steel" : ["poison"],
    "fire" : [],
    "water" : [],
    "grass" : [],
    "electric" : [],
    "psychic" : [],
    "ice" : [],
    "dragon" : [],
    "dark" : ["psychic"],
    "fairy" : ["dragon"],
]

typealias DownloadComplete = () -> ()
