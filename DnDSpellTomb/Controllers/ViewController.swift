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
    var searching = false
    
    
    @IBOutlet weak var spellSearch: UISearchBar!
    @IBOutlet weak var spellListTableView: UITableView!
    override func viewDidLoad() {
        spellListTableView.dataSource = self
        spellSearch.delegate = self
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
        if searching{
            let passURL = searchedSpell[indexPath.row]
            spellDescriptionViewController.passURL = passURL
        }else {
            let passURL = spells[indexPath.row]
            spellDescriptionViewController.passURL = passURL
        }
        
    }
    
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = spellListTableView.dequeueReusableCell(withIdentifier: "spellCell", for: indexPath) as? spellTableViewCell else {return UITableViewCell()}
        
        if searching {
            let spellToSet = searchedSpell[indexPath.row]
            cell.spellName.text = spellToSet.name
            return cell
        } else {
            let spellToSet = spells[indexPath.row]
            cell.spellName.text = spellToSet.name
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedSpell.count
        }else {
            return spells.count
        }
    }
}

var searchedSpell = [Spells]()

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedSpell = spells.filter ({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        spellListTableView.reloadData()
        
    }
    
}

