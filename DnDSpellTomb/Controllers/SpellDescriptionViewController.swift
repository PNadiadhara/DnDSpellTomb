//
//  SpellDescriptionViewController.swift
//  DnDSpellTomb
//
//  Created by Pritesh Nadiadhara on 1/2/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit




class SpellDescriptionViewController: UIViewController {
    var descAsString = ""
    var spelldetail = SpellDetail(name: "N/A", desc: [], higher_level: [], page: "N/A", range: "N/A", components: [], material: "N/A", ritual: "N/A", duration: "N/A", concentration: "N/A", casting_time: "N/A", level: 0)
  
    
    public var passURL: Spells!
    @IBOutlet weak var range: UILabel!
    @IBOutlet weak var components: UILabel!
    @IBOutlet weak var material: UITextView!
    @IBOutlet weak var ritutal: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var concentration: UILabel!
    @IBOutlet weak var casting: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var page: UILabel!
    @IBOutlet weak var spellDescription: UITextView!
    @IBOutlet weak var spellDescriptionHigherLevel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SpellAPIClient.getSpellDetail(passedURL: passURL.url) { (spellDetail, error) -> (Void) in
            if let spellDetail = spellDetail {
                self.spelldetail = spellDetail
            }
            if let error = error{
                print(error)
            }
        }
        
        NetworkHelper.performDataTask(urlString: passURL.url, httpMethod: "") { (error, data, response) in
            DispatchQueue.main.async {
                self.title = self.spelldetail.name
                self.spellDescription.text = self.arrayToString(input: self.spelldetail.desc ?? [""])
                self.spellDescriptionHigherLevel.text = self.arrayToString(input: self.spelldetail.higher_level ?? [""])
                self.range.text = "Range: \(self.spelldetail.range ?? "N/A")"
                self.components.text = "Components: \(self.arrayToString(input: self.spelldetail.components ?? ["N/A"]))"
                self.material.text = "Material: \(self.spelldetail.material ?? "N/A")"
                self.ritutal.text = "Ritual: \(self.spelldetail.ritual ?? "N/A")"
                self.duration.text = "Duration: \(self.spelldetail.duration ?? "N/A")"
                self.concentration.text = "Concentration: \(self.spelldetail.concentration ?? "N/A")"
                self.casting.text = "Cast Time: \(self.spelldetail.casting_time ?? "N/A")"
                self.level.text = "Level: \(String(self.spelldetail.level))"
                self.page.text = "Page: \(self.spelldetail.page ?? "N/A")"
            }
            
        }
        
    }
    
}

extension SpellDescriptionViewController {
    func arrayToString(input: [String])  -> String{
        self.descAsString = ""
        for i in 0 ..< input.count {
            self.descAsString += input[i]
        }
        return descAsString
    }
}
