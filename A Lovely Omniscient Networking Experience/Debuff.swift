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
        if (name == "Minor Starvation") {
            if (Int(arc4random_uniform(4)) < 1) {
                entity.EP -= 1
            }
        } else if (name == "Minor Dehydration") {
            if (Int(arc4random_uniform(4)) < 1) {
                entity.MP -= 1
            }
        } else if (name == "Regular Starvation") {
            if (Int(arc4random_uniform(4)) < 2) {
                entity.EP -= 1
            }
        } else if (name == "Regular Dehydration") {
            if (Int(arc4random_uniform(4)) < 2) {
                entity.MP -= 1
            }
        } else if (name == "Regular Starvation") {
            if (Int(arc4random_uniform(4)) < 2) {
                entity.EP -= 1
            }
        } else if (name == "Regular Dehydration") {
            if (Int(arc4random_uniform(4)) < 2) {
                entity.MP -= 1
            }
        } else if (name == "Major Starvation") {
            if (Int(arc4random_uniform(4)) < 3) {
                entity.EP -= 1
            }
        } else if (name == "Major Dehydration") {
            if (Int(arc4random_uniform(4)) < 3) {
                entity.MP -= 1
            }
        } else if (name == "Grand Starvation") {
            entity.EP -= 1
        } else if (name == "Grand Dehydration") {
            entity.MP -= 1
        } else if (name == "Minor Bleeding") {
            entity.HP -= 1
        } else if (name == "Regular Bleeding") {
            entity.HP -= 3
        } else if (name == "Major Bleeding") {
            entity.HP -= 6
        } else if (name == "Grand Bleeding") {
            entity.HP -= 10
        }
    }
    
    //These are stat debuffs that don't change until the debuff is removed.
    func setStats(){
        if (name == "Minor Bleeding") {
            bleedResist = -1
        } else if (name == "Regular Bleeding") {
            bleedResist = -3
        } else if (name == "Major Bleeding") {
            bleedResist = -6
        } else if (name == "Grand Bleeding") {
            bleedResist = -10
        } else if (name == "Minor Starvation") {
            physicalResist = -1
        } else if (name == "Regular Starvation") {
            physicalResist = -3
        } else if (name == "Major Starvation") {
            physicalResist = -6
        } else if (name == "Grand Starvation") {
            physicalResist = -10
        } else if (name == "Minor Dehydration") {
            mentalResist = -1
        } else if (name == "Regular Dehydration") {
            mentalResist = -3
        } else if (name == "Major Dehydration") {
            mentalResist = -6
        } else if (name == "Grand Dehydration") {
            mentalResist = -10
        }
    }
    
}
