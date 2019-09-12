//
//  BodyPart.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 7/16/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class BodyPart {
    
    let name: String
    var equipped: Equipment
    
    init (n: String) {
        
        name = n
        equipped = Equipment(n: "N/a", s: "N/a")
        
    }
    
}
