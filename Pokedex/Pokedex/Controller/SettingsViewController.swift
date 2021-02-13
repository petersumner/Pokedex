//
//  SettingsViewController.swift
//  Pokedex
//
//  Created by Peter Sumner on 2/12/21.
//  Copyright © 2021 Peter Sumner. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var themeButton: UIButton!
    @IBOutlet weak var themeTableView: UITableView!
    
    let themes = [
        "Default",
        "Grass",
        "Fire",
        "Water"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themeTableView.delegate = self
        themeTableView.dataSource = self
        self.themeTableView.isHidden = true
        
        loadSavedSettings()
    }
    
    func loadSavedSettings() {
        self.themeButton.setTitle(defaults.string(forKey: "Theme"), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "themeCell", for: indexPath)
        cell.textLabel?.text = themes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        themeButton.setTitle(cell?.textLabel?.text, for: .normal)
        defaults.setValue(cell?.textLabel?.text, forKey: "Theme")
        self.themeTableView.isHidden = true
    }
    
    @IBAction func themeBtnPressed(_ sender: Any) {
        self.themeTableView.isHidden = !self.themeTableView.isHidden
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
