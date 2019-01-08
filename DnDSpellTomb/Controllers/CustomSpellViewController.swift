//
//  CustomSpellViewController.swift
//  DnDSpellTomb
//
//  Created by Pritesh Nadiadhara on 1/7/19.
//  Copyright © 2019 Pritesh Nadiadhara. All rights reserved.
//

import UIKit

class CustomSpellViewController: UIViewController {
        //var customSpell = CustomSpellDetail(name: "N/A", desc: "N/A", higher_level: "N/A", page: "N/A", range: "N/A", components: "N/A", material: "N/A", ritual: "N/A", duration: "N/A", concentration: "N/A", casting_time: "N/A", level: -1)
    var customSpells = [SpellDetail]()
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var range: UITextField!
    @IBOutlet weak var components: UITextField!
    @IBOutlet weak var casting: UITextField!
    @IBOutlet weak var duration: UITextField!
    @IBOutlet weak var concentration: UITextField!
    @IBOutlet weak var ritual: UITextField!
    @IBOutlet weak var level: UITextField!
    @IBOutlet weak var page: UITextField!
    @IBOutlet weak var materials: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var higherLevel: UITextField!
    
  
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate =  self
        range.delegate = self
        components.delegate = self
        casting.delegate = self
        duration.delegate = self
        concentration.delegate = self
        ritual.delegate = self
        level.delegate = self
        page.delegate = self
        materials.delegate = self
        desc.delegate = self
        higherLevel.delegate = self
        
     
        
    }
    @IBAction func create(_ sender: Any) {
          // var customSpell = CustomSpellDetail(name: name.text ?? "N/A", desc: desc.text ?? "N/A", higher_level: higherLevel.text ?? "N/A", page: page.text ?? "N/A", range:range.text ?? "N/A", components: components.text ?? "N/A", material: materials.text ?? "N/A", ritual: ritual.text ?? "N/A", duration:duration.text ?? "N/A", concentration:concentration.text ?? "N/A", casting_time: casting.text ?? "N/A", level: -1)
        //var customSpell = Spells
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        name.resignFirstResponder()
        range.resignFirstResponder()
        components.resignFirstResponder()
        casting.resignFirstResponder()
        duration.resignFirstResponder()
        concentration.resignFirstResponder()
        ritual.resignFirstResponder()
        level.resignFirstResponder()
        page.resignFirstResponder()
        materials.resignFirstResponder()
        desc.resignFirstResponder()
        higherLevel.resignFirstResponder()
    }
    
   

}

extension CustomSpellViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension CustomSpellViewController {
    
}
