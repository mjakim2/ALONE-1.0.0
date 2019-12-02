//
//  Quest.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/23/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class Quest {
    
    var name: String
    
    /**
     * While it would be nice to fill up the enemies array upon instantiation,
     * but we simultaneously set up the images in BattleViewController.
     */
    var enemies: Array<EntityClass> = []
    
    var background: String = ""
    var introText: String = ""
    var locationTitle: String = ""
    var spoils: Array<Item> = []
    var ends: String = ""
    
    init(n: String){
        
        name = n
        
        if (name == "Baker's Tutorial") {
            introText = "Baker Louie: \"Oy, you still alive? You got knocked out when a rack of kitchenry fell on ya - my bad, I've been meaning to get a new shelf for some time. In case you've got amnesia, I hired ya to clear out this kitchen of these filthy rats - I can't go back to work until the inspector out there gives me the O.K. Until then, it's up to you to clear up my kitchen.\""
            let pan: Item = Item(n: "Shoddy Copper Pan", s: "Item")
            ends = ""
            spoils.append(pan)
            let cheese: Item = Item(n: "Cheddar Cheese Slice", s: "Consumable")
            spoils.append(cheese)
        } else if (name == "Day Hunting" || name == "Dusk Hunting" || name == "Dark Hunting" || name == "Dawn Hunting") {
            introText = "Just peaceful hunting. Feel free to end it whenever you like, or when the sky changes."
            ends = "Phase"
        } else if (name == "Cavesin to Caranith") {
            introText = "Head on over to Caranith! Be wary of bandits along the way."
            ends = ""
        } else if (name == "Cavesin at Day" || name == "Cavesin at Dusk" || name == "Cavesin at Dark" || name == "Cavesin at Dawn") {
            introText = "Explore this sleepy village however you like. The things you can do change depending on the time."
            ends = ""
        } else if (name == "Abandoned Castle") {
            introText = "This area's been abandoned by proper civilization, but you're not alone in here..."
            ends = ""
        } else if (name == "Cavesin Bakery") {
            introText = "Head back to the bakery for some oven-baked goods!"
            ends = "Night"
        } else if (name == "Cavesin Graveyard") {
            introText = "Take a round around the graveyard."
            ends = ""
        }
        
    }
    
    /**
     * Sets the name of the background of this quest.
     * It is dependent not only on the name but on the world biome,
     * so this can't be set upon initialization.
     */
    func setBackgroundName(biome: String) {
        
        if(name == "Baker's Tutorial"){
            background =  "Empty House"
        } else if (name == "Cavesin Graveyard" && biome == "Tundra"){
            background =  "Barren Graveyard"
        } else if (name == "Cavesin Graveyard" && biome == "Grove"){
            background =  "Green Graveyard"
        } else if (name == "Cavesin Graveyard" && biome == "Cordillera"){
            background =  "Dry Graveyard"
        } else if (name == "Day Hunting" && biome == "Tundra"){
            background =  "Tundra Fields"
        } else if (name == "Dusk Hunting" && biome == "Tundra"){
            background =  "Tundra Fields"
        } else if (name == "Dark Hunting" && biome == "Tundra"){
            background =  "Tundra Fields"
        } else if (name == "Dawn Hunting" && biome == "Tundra"){
            background =  "Tundra Fields"
        } else if (name == "Day Hunting" && biome == "Grove"){
            background =  "Birch Grove"
        } else if (name == "Dusk Hunting" && biome == "Grove"){
            background =  "Birch Grove"
        } else if (name == "Dark Hunting" && biome == "Grove"){
            background =  "Birch Grove"
        } else if (name == "Dawn Hunting" && biome == "Grove"){
            background =  "Birch Grove"
        } else if (name == "Day Hunting" && biome == "Cordillera"){
            background =  "Dry Woods"
        } else if (name == "Dusk Hunting" && biome == "Cordillera"){
            background =  "Dry Woods"
        } else if (name == "Dark Hunting" && biome == "Cordillera"){
            background =  "Dry Woods"
        } else if (name == "Dawn Hunting" && biome == "Cordillera"){
            background =  "Dry Woods"
        } else {
            background =  "Empty House"
        }
        
    }
    
}
