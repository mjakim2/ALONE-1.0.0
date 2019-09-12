//
//  Skill.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 7/11/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//
//This is but a simple cog in the machine for a character's abilities.

import Foundation

class Skill {
    
    let name: String
    var level: Int = 0
    let skillType: String
    
    init (n: String) {
        name = n
        
        if (n == "Food Prep" || n == "Serving Food" || n == "Boiling" || n == "Stewing" || n == "Sauteeing" || n == "Frying" || n == "Poaching" || n == "Flipping" || n == "Stirring") {
            skillType = "Cooking"
        } else if (n == "Coppersmithing" || n == "Blacksmithing" || n == "Silversmithing" || n == "Goldsmithing" || n == "Smelting") {
            skillType = "Smithing"
        } else if (n == "Bush Harvesting" || n == "Root Harvesting" || n == "Grain Harvesting" || n == "Tree Harvesting" || n == "Crop Harvesting" || n == "Watering") {
            skillType = "Agriculture"
        } else if (n == "Dishwashing" || n == "Floor Scrubbing" || n == "Sweeping" || n == "Sheet Folding" || n == "Clothes Washing") {
            skillType = "Housekeeping"
        } else if (n == "Blocking" || n == "Dodging" || n == "Kicking" || n == "Punching" || n == "One-handed Melee" || n == "Two-Handed Melee" || n == "Archery" || n == "Parrying" || n == "Countering") {
            skillType = "Fighting"
        } else {
            skillType = "Other"
        }
    }
    
}
