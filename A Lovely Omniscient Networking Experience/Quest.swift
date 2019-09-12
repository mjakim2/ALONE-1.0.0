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
    var enemies: Array<EntityClass> = []
    var background: String = ""
    var introText: String = ""
    var locationTitle: String = ""
    var spoils: Array<Item> = []
    var isTimeSensitive: Bool = false
    
    init(n: String){
        
        name = n
        
        if (name == "Baker's Tutorial") {
            introText = "Baker Louie: \"Oy, you still alive? You got knocked out when a rack of kitchenry fell on ya - my bad, I've been meaning to get a new shelf for some time. In case you've got amnesia, I hired ya to clear out this kitchen of these filthy rats - I can't go back to work until the inspector out there gives me the O.K. Until then, it's up to you to clear up my kitchen.\""
            let pan: Item = Item(n: "Shoddy Copper Pan", s: "Item")
            isTimeSensitive = false
            spoils.append(pan)
            let cheese: Item = Item(n: "Cheddar Cheese Slice", s: "Consumable")
            spoils.append(cheese)
        } else if (name == "Day Hunting" || name == "Dusk Hunting" || name == "Dark Hunting" || name == "Dawn Hunting") {
            introText = "Just peaceful hunting. Feel free to end it whenever you like."
            isTimeSensitive = true
        } else if (name == "Cavesin to Caranith") {
            introText = "Head on over to Caranith! Be wary of bandits along the way."
            isTimeSensitive = false
        } else if (name == "Cavesin at Day" || name == "Cavesin at Dusk" || name == "Cavesin at Dark" || name == "Cavesin at Dawn") {
            introText = "Explore this sleepy village however you like. The things you can do change depending on the time."
            isTimeSensitive = true
        } else if (name == "Abandoned Castle") {
            introText = "This area's been abandoned by proper civilization, but you're not alone in here..."
            isTimeSensitive = false
        } else if (name == "Cavesin Bakery") {
            introText = "Head back to the bakery for some oven-baked goods!"
            isTimeSensitive = true
        }
        
        
    }
    
}
