//
//  Shop.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 9/4/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class Shop {
    
    let name: String //The name of the shop!
    let items: Array<Item> //The items for sale...
    let prices: Array<Int> //The prices of said items.
    let amounts: Array<Int> //How much is in stock.
    //NOTICE: These arrays all have to have the same length.
    //For pricing considerations, 81 copper is one silver, and 81 silver is one gold. Each copper coin is a buck.
    
    init (n: String, i: Array<Item>, p: Array<Int>, a: Array<Int>) {
        
        name = n
        items = i
        prices = p
        amounts = a
        
    }
    
}
