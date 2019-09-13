//
//  StartViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/19/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var labelThree: UILabel!
    @IBOutlet var labelFour: UILabel!
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    
    var worlds: Array<WorldClass> = []
    var worldNumber: Int = 0
    var questNumber: Int = 0
    var didSucceed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questList()
        
        labelOne.text = worlds[worldNumber].quests[0].name
        labelTwo.text = worlds[worldNumber].quests[1].name
        labelThree.text = worlds[worldNumber].quests[2].name
        labelFour.text = worlds[worldNumber].quests[3].name
        
        if(worlds[worldNumber].quests[0].name != ""){
            buttonOne.isHidden = false
            buttonOne.isEnabled = true
        }
        if(worlds[worldNumber].quests[1].name != ""){
            buttonTwo.isHidden = false
            buttonTwo.isEnabled = true
        }
        if(worlds[worldNumber].quests[2].name != ""){
            buttonThree.isHidden = false
            buttonThree.isEnabled = true
        }
        if(worlds[worldNumber].quests[3].name != ""){
            buttonFour.isHidden = false
            buttonFour.isEnabled = true
        }
        
        view.backgroundColor = worlds[worldNumber].color
        
        //Collecting the names of the backgrounds for the quests...
        worlds[worldNumber].quests[0].background = setBackgroundName(n: worlds[worldNumber].quests[0].name)
        worlds[worldNumber].quests[1].background = setBackgroundName(n: worlds[worldNumber].quests[1].name)
        worlds[worldNumber].quests[2].background = setBackgroundName(n: worlds[worldNumber].quests[2].name)
        worlds[worldNumber].quests[3].background = setBackgroundName(n: worlds[worldNumber].quests[3].name)
        
        //...and then setting said backgrounds.
        setBackground(bg: imageOne, index: 0)
        setBackground(bg: imageTwo, index: 1)
        setBackground(bg: imageThree, index: 2)
        setBackground(bg: imageFour, index: 3)
        
    }
    
    func questList(){
        
        let time = worlds[worldNumber].time
        
        if(didSucceed){
            
            let completedQuest = worlds[worldNumber].quests[questNumber].name
            worlds[worldNumber].quests.remove(at: questNumber)
            
            //Setting the location based on movement.
            if(completedQuest == "Baker's Tutorial"){
                 worlds[worldNumber].quests.removeAll()
            }else if(completedQuest == "Travel to Caranith"){
                worlds[worldNumber].currentLocation = "Caranith"
            } else if(completedQuest == "Travel to Cavesin"){
                worlds[worldNumber].currentLocation = "Cavesin"
            }
            
        }
        
        //Adding on appropriate hunting quests.
        if(checkForQuest(n: "Day Hunting") < 0){
            setQuest(n: "Day Hunting")
        } else if(checkForQuest(n: "Dusk Hunting") < 0){
            setQuest(n: "Dusk Hunting")
        } else if(checkForQuest(n: "Dark Hunting") < 0){
            setQuest(n: "Dark Hunting")
        } else if(checkForQuest(n: "Dawn Hunting") < 0){
            setQuest(n: "Dawn Hunting")
        }
        
        //Adding on Caranith quests if in Caranith.
        if(worlds[worldNumber].currentLocation == "Caranith"){
            
            //Caranith Town Viewing Quests
            if(checkForQuest(n: "Caranith at Day") < 0 && (time >= 8*60 && time < 60*16)){
                setQuest(n: "Caranith at Day")
            } else if(checkForQuest(n: "Caranith at Dusk") < 0 && (time >= 16*60 && time < 60*20)){
                setQuest(n: "Caranith at Dusk")
            } else if(checkForQuest(n: "Caranith at Dark") < 0 && (time >= 16*60 && time < 60*20)){
                setQuest(n: "Caranith at Dark")
            } else if(checkForQuest(n: "Caranith at Dawn") < 0 && (time >= 16*60 && time < 60*20)){
                setQuest(n: "Caranith at Dawn")
            }
            
            //Caranith Stores
            if(checkForQuest(n: "Caranith Market") < 0 && (time >= 8*60 && time < 60*16)){
                setQuest(n: "Caranith Market")
            }
            
            //Travels
            if(checkForQuest(n: "Caranith to Cavesin") < 0){
                setQuest(n: "Caranith to Cavesin")
            }
            
        }
        
        //Adding on Caranith quests if in Cavesin.
        if(worlds[worldNumber].currentLocation == "Cavesin"){
            
            //Cavesin Town Viewing Quests
            if(checkForQuest(n: "Cavesin at Day") < 0 && (time >= 8*60 && time < 60*16)){
                setQuest(n: "Cavesin at Day")
            } else if(checkForQuest(n: "Cavesin at Dusk") < 0 && (time >= 16*60 && time < 60*20)){
                setQuest(n: "Cavesin at Dusk")
            } else if(checkForQuest(n: "Cavesin at Dark") < 0 && (time >= 16*60 && time < 60*20)){
                setQuest(n: "Cavesin at Dark")
            } else if(checkForQuest(n: "Cavesin at Dawn") < 0 && (time >= 16*60 && time < 60*20)){
                setQuest(n: "Cavesin at Dawn")
            }
            
            //Cavesin Stores
            if(checkForQuest(n: "Cavesin Market") < 0 && (time >= 8*60 && time < 60*16)){
                setQuest(n: "Cavesin Market")
            }
            
            //Travels
            if(checkForQuest(n: "Cavesin to Caranith") < 0){
                setQuest(n: "Cavesin to Caranith")
            }
            
        }
        
        //Code for clearing inaccurate hunting quests.
        if(checkForQuest(n: "Day Hunting") > 0 && (time < 60*8 || time >= 60*16)){
            worlds[worldNumber].quests.remove(at: checkForQuest(n: "Day Hunting"))
        } else if(checkForQuest(n: "Dusk Hunting") > 0 && (time < 60*16 || time >= 60*20)){
            worlds[worldNumber].quests.remove(at: checkForQuest(n: "Dusk Hunting"))
        } else if(checkForQuest(n: "Dark Hunting") > 0 && (time < 60*20 && time >= 60*4)){
            worlds[worldNumber].quests.remove(at: checkForQuest(n: "Dark Hunting"))
        } else if(checkForQuest(n: "Dawn Hunting") > 0 && (time < 60*4 || time >= 60*8)){
            worlds[worldNumber].quests.remove(at: checkForQuest(n: "Dawn Hunting"))
        }
        
        //Code for clearing quests based around Caranith.
        if(worlds[worldNumber].currentLocation == "Caranith"){
        
            //Clearing all inaccurate Caranith quests.
            if(checkForQuest(n: "Caranith at Day") > 0 && (time < 60*8 || time >= 60*16)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Day"))
            } else if(checkForQuest(n: "Caranith at Dusk") > 0 && (time < 60*16 || time >= 60*20)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Dusk"))
            } else if(checkForQuest(n: "Caranith at Dark") > 0 && (time < 60*20 && time >= 60*4)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Dark"))
            } else if(checkForQuest(n: "Caranith at Dawn") > 0 && (time < 60*4 || time >= 60*8)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Dawn"))
            }
        
        } else {
            
            //If outside of Caranith, clear all Caranith-based quests.
            if(checkForQuest(n: "Caranith at Day") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Day"))
            } else if(checkForQuest(n: "Caranith at Dusk") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Dusk"))
            } else if(checkForQuest(n: "Caranith at Dark") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Dark"))
            } else if(checkForQuest(n: "Caranith at Dawn") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Caranith at Dawn"))
            }
            
        }
        
        //Code for clearing quests based around Cavesin.
        if(worlds[worldNumber].currentLocation == "Cavesin"){
            
            //Clearing inaccurate Cavesin quests.
            if(checkForQuest(n: "Cavesin at Day") > 0 && (time < 60*8 || time >= 60*16)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Day"))
            } else if(checkForQuest(n: "Cavesin at Dusk") > 0 && (time < 60*16 || time >= 60*20)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Dusk"))
            } else if(checkForQuest(n: "Cavesin at Dark") > 0 && (time < 60*20 && time >= 60*4)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Dark"))
            } else if(checkForQuest(n: "Cavesin at Dawn") > 0 && (time < 60*4 || time >= 60*8)){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Dawn"))
            }
            
        } else {
            
            //If outside of Cavesin, clear all Cavesin-based quests.
            if(checkForQuest(n: "Cavesin at Day") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Day"))
            } else if(checkForQuest(n: "Cavesin at Dusk") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Dusk"))
            } else if(checkForQuest(n: "Cavesin at Dark") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Dark"))
            } else if(checkForQuest(n: "Cavesin at Dawn") > 0){
                worlds[worldNumber].quests.remove(at: checkForQuest(n: "Cavesin at Dawn"))
            }
            
        }
    }
    
    func setBackgroundName(n: String) -> String{
        
        let name = n
        
        if(name == "Baker's Tutorial"){
            return "Empty House"
        } else if (name == "Day Hunting" && worlds[worldNumber].geography == "Tundra"){
            return "Tundra Fields"
        } else if (name == "Dusk Hunting" && worlds[worldNumber].geography == "Tundra"){
            return "Tundra Fields"
        } else if (name == "Dark Hunting" && worlds[worldNumber].geography == "Tundra"){
            return "Tundra Fields"
        } else if (name == "Dawn Hunting" && worlds[worldNumber].geography == "Tundra"){
            return "Tundra Fields"
        } else if (name == "Day Hunting" && worlds[worldNumber].geography == "Grove"){
            return "Birch Grove"
        } else if (name == "Dusk Hunting" && worlds[worldNumber].geography == "Grove"){
            return "Birch Grove"
        } else if (name == "Dusk Hunting" && worlds[worldNumber].geography == "Grove"){
            return "Birch Grove"
        } else if (name == "Dusk Hunting" && worlds[worldNumber].geography == "Grove"){
            return "Birch Grove"
        }
        
        return "Empty House"
    }
    
    //Sets the quest indicated.
    func setQuest(n: String){
        let quest = Quest(n: n)
        worlds[worldNumber].quests.append(quest)
    }
    
    //Checks for if a quest of the same name is already in the quest list.
    func checkForQuest(n: String) -> Int {
        var counter = 0
        while (counter < worlds[worldNumber].quests.count) {
            if worlds[worldNumber].quests[counter].name == n {
                return counter
            }
            counter += 1
        }
        return -1
    }
    
    //Sets the background image for each quest.
    func setBackground(bg: UIImageView, index: Int){
        
        if (worlds[worldNumber].quests[index].background == "Empty House") {
            bg.image = UIImage(named: "EmptyHouseBackground00")
        } else if (worlds[worldNumber].quests[index].background == "Tundra Fields") {
            bg.image = UIImage(named: "TundraBackground00")
        } else if (worlds[worldNumber].quests[index].background == "Birch Grove") {
            bg.image = UIImage(named: "BirchGroveBackground00")
        } else {
            bg.image = UIImage(named: "EmptyHouseBackground00")
        }
        
    }
    
    //Starts the quest selected, given that there's a quest to start.
    func questStart(q: Int){
        
        questNumber = q
        print("The quest selected is #\(questNumber + 1)")
        if(worlds[worldNumber].quests[questNumber].name != ""){
            
            performSegue(withIdentifier: "startToIntro", sender: UIButton())
            
        }
        
    }
    
    @IBAction func questOneAction(_ sender: UIButton) {
    
        questStart(q: 0)
        
    }
    
    @IBAction func questTwoAction(_ sender: UIButton) {
    
        questStart(q: 1)
        
    }
    
    @IBAction func questThreeAction(_ sender: UIButton) {
        
        questStart(q: 2)
        
    }
    
    @IBAction func questFourAction(_ sender: UIButton) {
        
        questStart(q: 3)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "startToIntro" {
            
            let nvc = segue.destination as! IntroViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            nvc.questNumber = questNumber
            print("Successfully sent over data, headed to the intro of the quest \(questNumber).")
            
        } else if segue.identifier == "startToInventory" {
            
            let nvc = segue.destination as! InventoryViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed to the player's inventory.")
            
        } else if segue.identifier == "startToMenu" {
            
            let nvc = segue.destination as! MenuViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed back to the world menu.")
            
        }
    }
    
}
