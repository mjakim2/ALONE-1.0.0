//
//  WorldClass.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 12/25/18.
//  Copyright © 2018 Monsters & Minecarts. All rights reserved.
//

import Foundation
import UIKit

class WorldClass {
    
    //Descriptors of the world generated - vague for now.
    var geography: String = ""
    var society: String = ""
    var calamity: String = ""
    var generated: Bool = false
    var shops: Array<Shop> = []
    //Items that get passed around and determine the gameplay.
    var quests: Array<Quest> = []
    var day: Int = 0
    var surroundingTemperature: Int = 200
    var character: EntityClass!
    var time: Int = 60*8
    var worldTimer: Timer?
    var color: UIColor = UIColor()
    var currentLocation: String = "Cavesin"
    
}
