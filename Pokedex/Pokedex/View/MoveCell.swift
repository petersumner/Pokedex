//
//  MoveCell.swift
//  Pokedex
//
//  Created by Peter Sumner on 2/7/21.
//  Copyright © 2021 Peter Sumner. All rights reserved.
//

import UIKit

class MoveCell: UICollectionViewCell {
    
    @IBOutlet weak var learnLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var catLbl: UILabel!
    @IBOutlet weak var powerLbl: UILabel!
    @IBOutlet weak var accLbl: UILabel!
    @IBOutlet weak var ppLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(move: Move, learned: String) {
        
        learnLbl.text = learned
        nameLbl.text = move.name
        typeLbl.text = move.type
        catLbl.text = move.category
        powerLbl.text = "\(move.power)"
        accLbl.text = "\(move.accuracy)"
        ppLbl.text = "\(move.pp)"
    }
}
