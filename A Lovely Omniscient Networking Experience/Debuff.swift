//
//  Debuff.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/23/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class Debuff {
    
    //Simple biographical information.
    var duration: Int
    var name: String
    //A list of statistics that could be affected.
    var maxHP: Int = 0
    var maxEP: Int = 0
    var maxMP: Int = 0
    var accuracy: Int = 0
    var evasion: Int = 0
    var quickness: Int = 0
    var bleedResist: Int = 0
    var physicalResist: Int = 0
    var mentalResist: Int = 0
    var fireResist: Int = 0
    var frostResist: Int = 0
    var poisonResist: Int  = 0
    var stunResist: Int = 0
    var decrementHP = 0
    var decrementEP = 0
    var decrementMP = 0
    
    //Basic initializer.
    init (n: String, d: Int) {
        name = n
        duration = d
        setStats()
    }
    
    //These are DOTs and other effects that are applied every in-game minute.
    //This requires that the character be passed through, even when applied in the entity class.
    func activeEffects (entity: EntityClass) {
        entity.HP -= decrementHP
        entity.EP -= decrementEP
        entity.MP -= decrementMP
    }
    
    //These are stat debuffs that don't change until the debuff is removed.
    func setStats(){
        //DOT-Based Debuffs.
        if (name == "Minor Bleeding") {
            decrementHP = 1
        }
        //Miscellaneous Debuffs.
    }
    
    
}
