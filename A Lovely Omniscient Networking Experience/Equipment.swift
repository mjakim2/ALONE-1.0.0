//
//  Equipment.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 7/16/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class Equipment: Item {
    
    override init (i: String, q: String, s: String) {
        super.init(i: i, q: q, s: s)
        super.setStats()
    }
    
    override init (n: String, s: String) {
        super.init(n: n, s: s)
        super.setStats()
    }
    
    func isEmpty() -> Bool {
        for pocket in pockets {
            if (pocket.items.count > 0) {
                return false
            }
        }
        return true
    }
    
}
