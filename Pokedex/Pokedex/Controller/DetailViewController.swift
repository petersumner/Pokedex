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
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
    }
}
