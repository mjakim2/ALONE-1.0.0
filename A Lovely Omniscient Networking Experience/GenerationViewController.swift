//
//  GenerationViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 12/25/18.
//  Copyright © 2018 Monsters & Minecarts. All rights reserved.
//

import UIKit

class GenerationViewController: UIViewController {

    //Outlets for the society buttons. Used for enabling.
    @IBOutlet var humanButton: UIButton!
    @IBOutlet var elvenButton: UIButton!
    @IBOutlet var dwarvenButton: UIButton!
    
    //Outlets for the calamity buttons. Used for enabling.
    @IBOutlet var insurgencyButton: UIButton!
    @IBOutlet var plagueButton: UIButton!
    @IBOutlet var shortagesButton: UIButton!
    
    //Outlet for the transfer button. Used for enabling.
    @IBOutlet var nextButton: UIButton!
    
    //This data is transferred from the MenuViewController.
    var worlds: Array<WorldClass> = []
    var worldNumber: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //A test to see if the correct world has been selected.
        print(worldNumber + 1)
    }

    //Allows the user to select a society for the world to generate.
    func releaseSocieties(){
        
        humanButton.isEnabled = true
        elvenButton.isEnabled = true
        dwarvenButton.isEnabled = true
        
    }
    
    //Allows the user to select a calamity for the world to generate.
    func releaseCalamities(){
        
        insurgencyButton.isEnabled = true
        plagueButton.isEnabled = true
        shortagesButton.isEnabled = true
        
    }
    
    //Sets the geography to Tundra and unlocks the society buttons.
    @IBAction func tundraAction(_ sender: UIButton) {
        
        worlds[worldNumber].geography = "Tundra"
        releaseSocieties()
        print("\(worlds[worldNumber].geography) has been selected as the geography for world \(worldNumber + 1).")
        
    }
    
    //Sets the geography to Grove and unlocks the society buttons.
    @IBAction func groveAction(_ sender: UIButton) {
        
        worlds[worldNumber].geography = "Grove"
        releaseSocieties()
        print("\(worlds[worldNumber].geography) has been selected as the geography for world \(worldNumber + 1).")
        
    }
    
    //Sets the geography to Cordillera and unlocks the society buttons.
    @IBAction func cordilleraAction(_ sender: UIButton) {
        
        worlds[worldNumber].geography = "Cordillera"
        releaseSocieties()
        print("\(worlds[worldNumber].geography) has been selected as the geography for world \(worldNumber + 1).")
        
    }
    
    //Sets the society to Human and unlocks the calamity buttons.
    @IBAction func humanAction(_ sender: UIButton) {
        
        worlds[worldNumber].society = "Human"
        releaseCalamities()
        print("\(worlds[worldNumber].society) has been selected as the society for world \(worldNumber + 1).")
        
    }
    
    //Sets the society to Elven and unlocks the calamity buttons.
    @IBAction func elvenAction(_ sender: UIButton) {
        
        worlds[worldNumber].society = "Elven"
        releaseCalamities()
        print("\(worlds[worldNumber].society) has been selected as the society for world \(worldNumber + 1).")
        
    }
    
    //Sets the society to Dwarven and unlocks the calamity buttons.
    @IBAction func dwarvenAction(_ sender: UIButton) {
        
        worlds[worldNumber].society = "Dwarven"
        releaseCalamities()
        print("\(worlds[worldNumber].society) has been selected as the society for world \(worldNumber + 1).")
        
    }
    
    //Sets the calamity to Insurgency and unlocks the Next button.
    @IBAction func insurgencyAction(_ sender: UIButton) {
        
        worlds[worldNumber].calamity = "Insurgency"
        nextButton.isEnabled = true
        print("\(worlds[worldNumber].calamity) has been selected as the calamity for world \(worldNumber + 1).")
        
    }
    
    //Sets the calamity to Plague and unlocks the Next button.
    @IBAction func plagueAction(_ sender: UIButton) {
        
        worlds[worldNumber].calamity = "Plague"
        nextButton.isEnabled = true
        print("\(worlds[worldNumber].calamity) has been selected as the calamity for world \(worldNumber + 1).")
        
    }
    
    //Sets the calamity to Shortages and unlocks the Next button.
    @IBAction func shortagesAction(_ sender: UIButton) {
        
        worlds[worldNumber].calamity = "Shortages"
        nextButton.isEnabled = true
        print("\(worlds[worldNumber].calamity) has been selected as the calamity for world \(worldNumber + 1).")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var color: UIColor!
        if(worlds[worldNumber].geography == "Tundra"){
            color = UIColor.init(red: 0.6, green: 0.2, blue: 0.4, alpha: 1.0)
        } else if (worlds[worldNumber].geography == "Grove"){
            color = UIColor.init(red: 0.4, green: 0.6, blue: 0.2, alpha: 1.0)
        } else if (worlds[worldNumber].geography == "Cordillera"){
            color = UIColor.init(red: 0.2, green: 0.4, blue: 0.6, alpha: 1.0)
        }
        worlds[worldNumber].color = color
        
        //Sets a boolean true so as to save the world upon reloading.
        worlds[worldNumber].generated = true
        
        //Creates a filler class for the character.
        let you: EntityClass = EntityClass(n: "Matthew Jakimovski")
        //The actual speed is 5, so double all future values for clarity.
        worlds[worldNumber].character = you
        
        //Adds in the base actions of the player.
        worlds[worldNumber].character.actions.append("Stand")
        worlds[worldNumber].character.actions.append("Move Forward")
        worlds[worldNumber].character.actions.append("Attack")
        worlds[worldNumber].character.actions.append("Pick Up")
        
        //Sets up the starter quest.
        let bakerTutorial: Quest = Quest(n: "Baker's Tutorial")
        let empty = Quest(n: "")
        worlds[worldNumber].quests.append(bakerTutorial)
        worlds[worldNumber].quests.append(empty)
        worlds[worldNumber].quests.append(empty)
        worlds[worldNumber].quests.append(empty)
        
        //Sets up the world's shops.
        //The first shop is the tutorial bakery found in Cavesin.
        var tutorialBakeryInventory: Array<Item> = []
        var tutorialBakeryPrices: Array<Int> = []
        var tutorialBakeryAmounts: Array<Int> = []
        //A shoddy kilo of bread is 15 cp; for specialty is 60.
        let bread: Item = Item(n: "Shoddy Wheat Hoagie", s: "Consumable")
        tutorialBakeryInventory.append(bread)
        tutorialBakeryPrices.append(15)
        tutorialBakeryAmounts.append(13)
        let cheese: Item = Item(n: "Shoddy Slice of Goat Cheese", s: "Consumable")
        tutorialBakeryPrices.append(2)
        tutorialBakeryAmounts.append(24)
        //A kilo of shoddy goat cheese is 16 cp; for specialty is 64.
        tutorialBakeryInventory.append(cheese)
        let tutorialBakery: Shop = Shop(n: "Cavesin Bakery", i: tutorialBakeryInventory, p: tutorialBakeryPrices, a: tutorialBakeryAmounts)
        worlds[worldNumber].shops.append(tutorialBakery)
        
        //Sends over the data and moves the ViewController.
        if segue.identifier == "startWorld" {
            
            let nvc = segue.destination as! StartViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed to play the world newly generated.")
            
        }
        
    }
    
}
