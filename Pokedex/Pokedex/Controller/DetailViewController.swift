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
    @IBOutlet weak var descriptionLbl: UILabel!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
        pokemon.downloadPokemonDetail {
            print(pokemon.height)
            self.updateUI()
        }
    }
    
    func updateUI() {
        mainImg.image = UIImage(named: "\(pokemon.pokedexID)")
        nameLbl.text = pokemon.name
        pokedexLbl.text = "\(pokemon.pokedexID)"
        heightLbl.text = "\(pokemon.height)"
        weightLbl.text = "\(pokemon.weight)"
        hpLbl.text = "\(pokemon.stats[0])"
        attackLbl.text = "\(pokemon.stats[1])"
        defenseLbl.text = "\(pokemon.stats[2])"
        spatkLbl.text = "\(pokemon.stats[3])"
        spdefLbl.text = "\(pokemon.stats[4])"
        speedLbl.text = "\(pokemon.stats[5])"
        
        
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
