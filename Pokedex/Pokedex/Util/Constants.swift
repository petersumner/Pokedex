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

let defaults = UserDefaults.standard

let colors = [
    "normal" : UIColor(red: 0.66, green: 0.65, blue: 0.48, alpha: 1.00),
    "fighting" : UIColor(red: 0.76, green: 0.18, blue: 0.16, alpha: 1.00),
    "flying" : UIColor(red: 0.54, green: 0.44, blue: 0.83, alpha: 1.00),
    "poison" : UIColor(red: 0.64, green: 0.24, blue: 0.63, alpha: 1.00),
    "ground" : UIColor(red: 0.89, green: 0.75, blue: 0.40, alpha: 1.00),
    "rock" : UIColor(red: 0.71, green: 0.63, blue: 0.21, alpha: 1.00),
    "bug" : UIColor(red: 0.59, green: 0.60, blue: 0.10, alpha: 1.00),
    "ghost" : UIColor(red: 0.45, green: 0.34, blue: 0.59, alpha: 1.00),
    "steel" : UIColor(red: 0.72, green: 0.72, blue: 0.81, alpha: 1.00),
    "fire" : UIColor(red: 0.93, green: 0.51, blue: 0.19, alpha: 1.00),
    "water" : UIColor(red: 0.39, green: 0.56, blue: 0.75, alpha: 1.00),
    "grass" : UIColor(red: 0.48, green: 0.67, blue: 0.27, alpha: 1.00),
    "electric" : UIColor(red: 0.97, green: 0.82, blue: 0.17, alpha: 1.00),
    "psychic" : UIColor(red: 0.98, green: 0.33, blue: 0.53, alpha: 1.00),
    "ice" : UIColor(red: 0.59, green: 0.85, blue: 0.84, alpha: 1.00),
    "dragon" : UIColor(red: 0.31, green: 0.08, blue: 0.86, alpha: 1.00),
    "dark" : UIColor(red: 0.44, green: 0.34, blue: 0.27, alpha: 1.00),
    "fairy" : UIColor(red: 0.84, green: 0.52, blue: 0.68, alpha: 1.00),
    "darkMode" : UIColor(red: 0.12, green: 0.13, blue: 0.14, alpha: 1.00)
]

let types = [
    "normal" : ["weak" : ["fighting"], "resist" : [], "immune" : ["ghost"]],
    "fighting" : ["weak" : ["flying", "psychic", "fairy"], "resist" : ["rock", "bug", "dark"], "immune" : ["ghost"]],
    "flying" : ["weak" : ["rock", "electric", "ice"], "resist" : ["fighting", "bug", "grass"], "immune" : ["ground"]],
    "poison" : ["weak" : ["ground", "psychic"], "resist" : ["fighting", "poison", "bug", "grass", "fairy"], "immune" : []],
    "ground" : ["weak" : ["water", "grass", "ice"], "resist" : ["poison", "rock"], "immune" : ["electric"]],
    "rock" : ["weak" : ["fighting", "ground", "steel", "water", "grass"], "resist" : ["normal", "flying", "poison", "fire"], "immune" : []],
    "bug" : ["weak" : ["flying", "rock", "fire"], "resist" : ["fighting", "ground", "grass"], "immune" : []],
    "ghost" : ["weak" : ["ghost", "dark"], "resist" : ["poison", "bug"], "immune" : ["normal", "fighting"]],
    "steel" : ["weak" : ["fighting", "ground", "fire"], "resist" : ["normal", "flying", "rock", "bug", "steel", "grass", "psychic", "ice", "dragon", "fairy"], "immune" : ["poison"]],
    "fire" : ["weak" : ["ground", "rock", "water"], "resist" : ["bug", "steel", "fire", "grass", "ice", "fairy"], "immune" : []],
    "water" : ["weak" : ["grass", "electric"], "resist" : ["steel", "fire", "water", "ice"], "immune" : []],
    "grass" : ["weak" : ["flying", "poison", "bug", "fire", "ice"], "resist" : ["ground", "water", "grass", "electric"], "immune" : []],
    "electric" : ["weak" : ["ground"], "resist" : ["flying", "steel", "electric"], "immune" : []],
    "psychic" : ["weak" : ["bug", "ghost", "dark"], "resist" : ["fighting", "psychic"], "immune" : []],
    "ice" : ["weak" : ["fighting", "rock", "steel", "fire"], "resist" : ["ice"], "immune" : []],
    "dragon" : ["weak" : ["ice", "dragon", "fairy"], "resist" : ["fire", "water", "grass", "electric"], "immune" : []],
    "dark" : ["weak" : ["fighting", "bug", "fairy"], "resist" : ["ghost", "dark"], "immune" : ["psychic"]],
    "fairy" : ["weak" : ["poison", "steel"], "resist" : ["fighting", "bug", "dark"], "immune" : ["dragon"]],
]

typealias DownloadComplete = () -> ()
