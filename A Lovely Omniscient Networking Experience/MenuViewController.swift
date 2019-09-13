//
//  MenuViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/19/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var worlds: Array<WorldClass>!
    var worldNumber: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(worlds == nil){
            
            worlds = []
            worlds.append(WorldClass())
            worlds.append(WorldClass())
            worlds.append(WorldClass())
            worlds.append(WorldClass())
            
        }
    }

    func selectOrCreate(n: Int){
        
        worldNumber = n
        
        if(worlds[n].generated){
            
            performSegue(withIdentifier: "selectWorld", sender: UIButton())
            
        } else {
            
            performSegue(withIdentifier: "createWorld", sender: UIButton())
            
        }
        
    }
    
    @IBAction func worldOneAction(_ sender: UIButton) {
        selectOrCreate(n: 0)
    }
    
    @IBAction func worldTwoAction(_ sender: UIButton) {
        selectOrCreate(n: 1)
    }
    
    @IBAction func worldThreeAction(_ sender: UIButton) {
        selectOrCreate(n: 2)
    }
    
    @IBAction func worldFourAction(_ sender: UIButton) {
        selectOrCreate(n: 3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectWorld" {
            
            let nvc = segue.destination as! StartViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed to play the world selected.")
            
        } else if segue.identifier == "createWorld" {
            
            let nvc = segue.destination as! GenerationViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed to create the world selected.")
            
        }
        
    }
    
}
