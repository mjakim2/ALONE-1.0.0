//
//  Pocket.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 7/10/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class Pocket {
    
    var maxSize: Int
    var maxWeight: Int
    var items: Array<Item> = []
    
    //Checks the combined weight of all things still inside this pocket.
    func checkWeight () -> Int {
        var sum = 0
        for item in items {
            sum += item.weight
        }
        return sum
    }
    
    init (ms: Int, mx: Int) {
        maxSize = ms
        maxWeight = mx
    }
    
}
