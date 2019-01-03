//
//  Spell.swift
//  DnDSpellTomb
//
//  Created by Pritesh Nadiadhara on 12/25/18.
//  Copyright © 2018 Pritesh Nadiadhara. All rights reserved.
//

import Foundation

struct Spell: Codable{
    let count: Int
    let results:[Spells]
}
struct Spells: Codable{
    let name: String
    let url: String
}

struct SpellDetail: Codable{
    let name: String?
    let desc: [String]?
    let higher_level: [String]?
    let page: String?
    let range: String?
    let components: [String]?
    let material: String?
    let ritual: String?
    let duration: String?
    let concentration: String?
    let casting_time: String?
    let level: Int
//    let school: School
//    let classes: Classes
//    let subclasses: Subclasses
    
    init(name: String, desc: [String], higher_level:[String], page: String, range: String, components: [String], material: String, ritual: String, duration: String, concentration: String, casting_time: String, level: Int) {
        self.name = name
        self.desc = desc
        self.higher_level = higher_level
        self.page = page
        self.range = range
        self.components = components
        self.material = material
        self.ritual = ritual
        self.duration = duration
        self.concentration = concentration
        self.casting_time = casting_time
        self.level = level        
    }
}


struct School: Codable {
    let name: String
    let url: String
}
struct Classes: Codable {
    let url: String
    let name: String
}
struct Subclasses: Codable{
    let url: String
    let name: String
}
