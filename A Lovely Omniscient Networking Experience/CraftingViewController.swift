//
//  CraftingViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 5/6/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class CraftingViewController: UIViewController {

    @IBOutlet var upperLeftButton: UIButton!
    @IBOutlet var uppercCenterButton: UIButton!
    @IBOutlet var upperRightButton: UIButton!
    @IBOutlet var middleLeftButton: UIButton!
    @IBOutlet var middleCenterButton: UIButton!
    @IBOutlet var middleRightButton: UIButton!
    @IBOutlet var lowerLeftButton: UIButton!
    @IBOutlet var lowerCenterButton: UIButton!
    @IBOutlet var lowerRightButton: UIButton!
    
    @IBOutlet var chestButton: UIButton!
    @IBOutlet var legsButton: UIButton!
    
    var worlds: Array<WorldClass> = []
    var worldNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func previousChestAction(_ sender: UIButton) {
    }
    @IBAction func currentChestAction(_ sender: UIButton) {
    }
    @IBAction func nextChestAction(_ sender: UIButton) {
    }
    @IBAction func previousLegsAction(_ sender: UIButton) {
    }
    @IBAction func currentLegsAction(_ sender: UIButton) {
    }
    @IBAction func nextLegsAction(_ sender: UIButton) {
    }
    
}
