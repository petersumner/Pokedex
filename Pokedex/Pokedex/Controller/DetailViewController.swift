//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Peter Sumner on 11/9/20.
//  Copyright © 2020 Peter Sumner. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var hpLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var spatkLbl: UILabel!
    @IBOutlet weak var spdefLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var prevEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var segmentHeader: UISegmentedControl!
    @IBOutlet weak var typeText: UILabel!
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var hpText: UILabel!
    @IBOutlet weak var attacktext: UILabel!
    @IBOutlet weak var defenseText: UILabel!
    @IBOutlet weak var spatkText: UILabel!
    @IBOutlet weak var spdefText: UILabel!
    @IBOutlet weak var speedText: UILabel!
    @IBOutlet weak var evoBanner: UIView!
    
    var colors = [
        "normal" : UIColor(red: 0.66, green: 0.65, blue: 0.48, alpha: 1.00),
        "fire" : UIColor(red: 0.93, green: 0.51, blue: 0.19, alpha: 1.00),
        "water" : UIColor(red: 0.39, green: 0.56, blue: 0.94, alpha: 1.00),
        "electric" : UIColor(red: 0.97, green: 0.82, blue: 0.17, alpha: 1.00),
        "grass" : UIColor(red: 0.48, green: 0.78, blue: 0.30, alpha: 1.00),
        "ice" : UIColor(red: 0.59, green: 0.85, blue: 0.84, alpha: 1.00),
        "fighting" : UIColor(red: 0.76, green: 0.18, blue: 0.16, alpha: 1.00),
        "poison" : UIColor(red: 0.64, green: 0.24, blue: 0.63, alpha: 1.00),
        "ground" : UIColor(red: 0.89, green: 0.75, blue: 0.40, alpha: 1.00),
        "flying" : UIColor(red: 0.66, green: 0.56, blue: 0.95, alpha: 1.00),
        "psychic" : UIColor(red: 0.98, green: 0.33, blue: 0.53, alpha: 1.00),
        "bug" : UIColor(red: 0.65, green: 0.73, blue: 0.10, alpha: 1.00),
        "rock" : UIColor(red: 0.71, green: 0.63, blue: 0.21, alpha: 1.00),
        "ghost" : UIColor(red: 0.45, green: 0.34, blue: 0.59, alpha: 1.00),
        "dragon" : UIColor(red: 0.44, green: 0.21, blue: 0.99, alpha: 1.00),
        "dark" : UIColor(red: 0.44, green: 0.34, blue: 0.27, alpha: 1.00),
        "steel" : UIColor(red: 0.72, green: 0.72, blue: 0.81, alpha: 1.00),
        "fairy" : UIColor(red: 0.84, green: 0.52, blue: 0.68, alpha: 1.00)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemon.downloadPokemonDetail{
            self.updateUI()
        }
    }
    
    func updateUI() {
        mainImg.image = UIImage(named: "\(pokemon.pokedexID)")
        prevEvoImg.image = UIImage(named: "\(pokemon.pokedexID-1)")
        nextEvoImg.image = UIImage(named: "\(pokemon.pokedexID+1)")
        nameLbl.text = pokemon.name
        if pokemon.pokedexID < 10 {
            pokedexLbl.text = "#00\(pokemon.pokedexID)"
        } else if pokemon.pokedexID < 100 {
            pokedexLbl.text = "#0\(pokemon.pokedexID)"
        } else {
            pokedexLbl.text = "#\(pokemon.pokedexID)"
        }
        heightLbl.text = "\(pokemon.height) m"
        weightLbl.text = "\(pokemon.weight) kg"
        hpLbl.text = "\(pokemon.stats[0])"
        attackLbl.text = "\(pokemon.stats[1])"
        defenseLbl.text = "\(pokemon.stats[2])"
        spatkLbl.text = "\(pokemon.stats[3])"
        spdefLbl.text = "\(pokemon.stats[4])"
        speedLbl.text = "\(pokemon.stats[5])"
        if pokemon.types.count > 1 {
            typeLbl.text = "\(pokemon.types[0].capitalized) / \(pokemon.types[1].capitalized)"
        } else {
            typeLbl.text = "\(pokemon.types[0].capitalized)"
        }
        header.backgroundColor = colors[pokemon.types[0]]
        segmentHeader.selectedSegmentTintColor = colors[pokemon.types[0]]
        typeText.textColor = colors[pokemon.types[0]]
        heightText.textColor = colors[pokemon.types[0]]
        weightText.textColor = colors[pokemon.types[0]]
        hpText.textColor = colors[pokemon.types[0]]
        attacktext.textColor = colors[pokemon.types[0]]
        defenseText.textColor = colors[pokemon.types[0]]
        spatkText.textColor = colors[pokemon.types[0]]
        spdefText.textColor = colors[pokemon.types[0]]
        speedText.textColor = colors[pokemon.types[0]]
        evoBanner.backgroundColor = colors[pokemon.types[0]]
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
