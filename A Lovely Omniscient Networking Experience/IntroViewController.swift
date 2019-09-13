//
//  IntroViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/19/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var questTitle: UILabel!
    @IBOutlet var introText: UILabel!
    
    var worlds: Array<WorldClass> = []
    var worldNumber: Int = 0
    var questNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = worlds[worldNumber].color
        introText.text = worlds[worldNumber].quests[questNumber].introText
        questTitle.text = worlds[worldNumber].quests[questNumber].name
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "introToBattle" {
            
            let nvc = segue.destination as! BattleViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            nvc.questNumber = questNumber
            print("Successfully sent over data, headed to start the quest selected (#\(questNumber + 1)).")
            
        } else if segue.identifier == "introToStart" {
            
            let nvc = segue.destination as! StartViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed back to the quest list.")
            
        }
        
    }
    
}
