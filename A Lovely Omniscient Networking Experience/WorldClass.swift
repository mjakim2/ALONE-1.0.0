//
//  WorldClass.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 12/25/18.
//  Copyright © 2018 Monsters & Minecarts. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

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
    var songPlaying: String = ""
    var audioPlayer = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "ALONE_THEME", ofType: "m4a")!) as URL)

    func playTrack(name: String) {
        if (songPlaying != name) {
            audioPlayer.stop()
            let url: URL = NSURL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "m4a")!) as URL
            audioPlayer = try! AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            songPlaying = name
        }
    }
    
}
