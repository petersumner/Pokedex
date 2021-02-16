//
//  TabController.swift
//  Pokedex
//
//  Created by Peter Sumner on 2/14/21.
//  Copyright © 2021 Peter Sumner. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    var poke: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let statVC = self.viewControllers![0] as! StatViewController
        statVC.pokemon = poke
    }
}
