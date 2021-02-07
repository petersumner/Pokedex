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
    var labels: [String: UILabel]!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var hpLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var spatkLbl: UILabel!
    @IBOutlet weak var spdefLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var segmentHeader: UISegmentedControl!
    @IBOutlet weak var typeText: UILabel!
    @IBOutlet weak var hpText: UILabel!
    @IBOutlet weak var attacktext: UILabel!
    @IBOutlet weak var defenseText: UILabel!
    @IBOutlet weak var spatkText: UILabel!
    @IBOutlet weak var spdefText: UILabel!
    @IBOutlet weak var speedText: UILabel!
    @IBOutlet weak var hpBar: UIProgressView!
    @IBOutlet weak var atkBar: UIProgressView!
    @IBOutlet weak var defBar: UIProgressView!
    @IBOutlet weak var spatkBar: UIProgressView!
    @IBOutlet weak var spdefBar: UIProgressView!
    @IBOutlet weak var spdBar: UIProgressView!
    
    @IBOutlet weak var normalLbl: UILabel!
    @IBOutlet weak var fireLbl: UILabel!
    @IBOutlet weak var waterLbl: UILabel!
    @IBOutlet weak var electricLbl: UILabel!
    @IBOutlet weak var grassLbl: UILabel!
    @IBOutlet weak var iceLbl: UILabel!
    @IBOutlet weak var fightingLbl: UILabel!
    @IBOutlet weak var poisonLbl: UILabel!
    @IBOutlet weak var groundLbl: UILabel!
    @IBOutlet weak var flyingLbl: UILabel!
    @IBOutlet weak var psychicLbl: UILabel!
    @IBOutlet weak var bugLbl: UILabel!
    @IBOutlet weak var rockLbl: UILabel!
    @IBOutlet weak var ghostLbl: UILabel!
    @IBOutlet weak var dragonLbl: UILabel!
    @IBOutlet weak var steelLbl: UILabel!
    @IBOutlet weak var darkLbl: UILabel!
    @IBOutlet weak var fairyLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labels = ["normal" : normalLbl, "fighting" : fightingLbl, "flying" : flyingLbl, "poison" : poisonLbl, "ground" : groundLbl, "rock" : rockLbl, "bug" : bugLbl, "ghost" : ghostLbl, "steel" : steelLbl, "fire" : fireLbl, "water" : waterLbl, "grass" : grassLbl, "electric" : electricLbl, "psychic" : psychicLbl, "ice" : iceLbl, "dragon" : dragonLbl, "dark" : darkLbl, "fairy" : fairyLbl]
        
        pokemon.downloadPokemonDetail{
            self.updateUI()
        }
    }
    
    func updateUI() {
        mainImg.image = UIImage(named: "\(pokemon.pokedexID)")
        let screenSize: CGRect = UIScreen.main.bounds
        let bgImg = UIImageView(image: UIImage(named: "\(pokemon.types[0])BG"))
        bgImg.center = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2 - 20)
        bgImg.transform = CGAffineTransform(scaleX: screenSize.width / 700, y: screenSize.height / 1200)
        self.view.insertSubview(bgImg, at: 0)
        nameLbl.text = pokemon.name
        if pokemon.pokedexID < 10 {
            pokedexLbl.text = "#00\(pokemon.pokedexID)"
        } else if pokemon.pokedexID < 100 {
            pokedexLbl.text = "#0\(pokemon.pokedexID)"
        } else {
            pokedexLbl.text = "#\(pokemon.pokedexID)"
        }
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
        hpText.textColor = colors[pokemon.types[0]]
        attacktext.textColor = colors[pokemon.types[0]]
        defenseText.textColor = colors[pokemon.types[0]]
        spatkText.textColor = colors[pokemon.types[0]]
        spdefText.textColor = colors[pokemon.types[0]]
        speedText.textColor = colors[pokemon.types[0]]
                
        hpBar.progressTintColor = colors[pokemon.types[0]]
        atkBar.progressTintColor = colors[pokemon.types[0]]
        defBar.progressTintColor = colors[pokemon.types[0]]
        spatkBar.progressTintColor = colors[pokemon.types[0]]
        spdefBar.progressTintColor = colors[pokemon.types[0]]
        spdBar.progressTintColor = colors[pokemon.types[0]]
        hpBar.layer.cornerRadius = 7
        atkBar.layer.cornerRadius = 7
        defBar.layer.cornerRadius = 7
        spatkBar.layer.cornerRadius = 7
        spdefBar.layer.cornerRadius = 7
        spdBar.layer.cornerRadius = 7
        hpBar.progress = Float(pokemon.stats[0]) / 255.0
        atkBar.progress = Float(pokemon.stats[1]) / 255.0
        defBar.progress = Float(pokemon.stats[2]) / 255.0
        spatkBar.progress = Float(pokemon.stats[3]) / 255.0
        spdefBar.progress = Float(pokemon.stats[4]) / 255.0
        spdBar.progress = Float(pokemon.stats[5]) / 255.0
        
        for type in labels {
            type.value.text = "1x"
        }
        
        for slot in pokemon.types {
            let typeData = types[slot]!
            let weak = typeData["weak"]!
            let resist = typeData["resist"]!
            let immune = typeData["immune"]!
            for type in immune {
                labels[type]!.text = "0x"
            }
            for type in weak {
                let mult = labels[type]!.text!.dropLast()
                var x = 1.0
                if mult == "1/4" {
                    x = 0.5
                } else if mult == "1/2" {
                    x = 1
                } else {
                    x = Double(mult)! * 2.0
                }
                if x == 0.5 {
                    labels[type]!.text = "1/2x"
                } else {
                    labels[type]!.text = "\(String(describing: Int(x)))x"
                }
            }
            for type in resist {
                let mult = labels[type]!.text!.dropLast()
                var x = 1.0
                if mult == "1/2" {
                    x = 0.25
                } else if mult == "1/4" {
                    x = 0.25
                } else {
                    print(pokemon.types)
                    print(mult, type)
                    x = Double(mult)! / 2.0
                }
                if x == 0.25 {
                    labels[type]!.text = "1/4x"
                } else if x == 0.5 {
                    labels[type]!.text = "1/2x"
                } else {
                    labels[type]!.text = "\(String(describing: Int(x)))x"
                }
            }
        }
        
    }
    
    func typeEffectiveness (type: UILabel) {
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
