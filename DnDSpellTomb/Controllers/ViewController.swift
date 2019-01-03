//
//  ViewController.swift
//  DnDSpellTomb
//
//  Created by Pritesh Nadiadhara on 12/25/18.
//  Copyright © 2018 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   // @IBOutlet weak var spellName: UILabel!
    var spells = [Spells](){
        didSet{
            DispatchQueue.main.async {
                self.spellListTableView.reloadData()
            }
        }
    }

    @IBOutlet weak var spellListTableView: UITableView!
    override func viewDidLoad() {
        spellListTableView.dataSource = self
        super.viewDidLoad()
       
        SpellAPIClient.getAllSpells { (spells, error) -> (Void) in
            if let spells = spells {
                self.spells = spells
            }
            if let error = error{
                print(error)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = spellListTableView.indexPathForSelectedRow,let spellDescriptionViewController = segue.destination as? SpellDescriptionViewController else {fatalError("missing index path, spellDetailController")}
        let passURL = spells[indexPath.row]
        spellDescriptionViewController.passURL = passURL
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let currentCrayon = allCrayons[indexPath.row]
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as? ColorCell else {return UITableViewCell()}

        guard let cell = spellListTableView.dequeueReusableCell(withIdentifier: "spellCell", for: indexPath) as? spellTableViewCell else {return UITableViewCell()}
        let spellToSet = spells[indexPath.row]
        cell.spellName.text = spellToSet.name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spells.count
        
    }
}
