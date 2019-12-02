//
//  VictoryViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 4/23/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class VictoryViewController: UIViewController {

    @IBOutlet var spoilsResponse: UILabel!
    @IBOutlet var inventoryResponse: UILabel!
    //Spoils buttons:
    @IBOutlet var currentSpoil: UIButton!
    @IBOutlet var previousSpoil: UIButton!
    @IBOutlet var nextSpoil: UIButton!
    @IBOutlet var storeSpoilButton: UIButton!
    @IBOutlet var equipSpoilButton: UIButton!
    //Inventory Buttons:
    @IBOutlet var previousInventory: UIButton!
    @IBOutlet var currentInventory: UIButton!
    @IBOutlet var nextInventory: UIButton!
    @IBOutlet var dropInventoryButton: UIButton!
    @IBOutlet var equipInventoryButton: UIButton!
    
    var worlds: Array<WorldClass> = []
    var worldNumber: Int = 0
    var questNumber: Int = 0
    
    var bodyIndex: Int = -1;
    var pocketIndex: Int = -1;
    var contentIndex: Int = -1;
    
    var spoilIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Clearing the names of the spoils and inventory buttons, as well as the response bars.
        currentSpoil.setTitle("", for: .normal)
        currentInventory.setTitle("", for: .normal)
        spoilsResponse.text = ""
        inventoryResponse.text = ""
        //Setting the spoils image for the first time.
        if (worlds[worldNumber].quests[questNumber].spoils.count > 0) {
            spoilIndex = 0
            setSpoil()
        } else {
            storeSpoilButton.isEnabled = false
            equipSpoilButton.isEnabled = false
        }
        
        var bodyCount: Int = 0
        //We will sift through all bodyParts and look for the first equipment that contains not just pockets, but items in pockets.
        while (bodyCount < worlds[worldNumber].character.bodyParts.count) {
            let bodyPart: BodyPart = worlds[worldNumber].character.bodyParts[bodyCount]
            //If the bodyPart has an item with pockets, continue.
            if (bodyPart.equipped.pockets.count > 0) {
                //Now we consider whether the item will actually be found by inserting this boolean.
                var didFindItem: Bool = false
                bodyIndex = bodyCount
                var pocketCount = 0
                //We now go through each pocket.
                while (pocketCount < bodyPart.equipped.pockets.count) {
                    let pocket: Pocket = bodyPart.equipped.pockets[pocketCount]
                    //If the pocket has items, continue.
                    if (pocket.items.count > 0) {
                        //Once successful, set the count of the pocket in the specified item, and leave the loop so we don't skip this item.
                        pocketIndex = pocketCount
                        bodyIndex = bodyCount
                        contentIndex = 0
                        didFindItem = true
                        break
                    }
                    pocketCount += 1
                }
                //After sifting through the pockets, see if we ever actually found an item. If we did, leave the loop so we don't skip said pockets.
                if (didFindItem) {
                    break
                }
            }
            bodyCount += 1
        }
        
        //Now that we have a bodyIndex, pocketIndex, and contentIndex (the third one should be zero), we can display its image.
        if (contentIndex != -1) {
            currentInventory.setBackgroundImage(UIImage(named: worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items[contentIndex].name), for: .normal)
            inventoryResponse.text = worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items[contentIndex].name
        }
        
    }
    
    @IBAction func previousSpoilAction(_ sender: UIButton) {
        if (spoilIndex > 0) {
            spoilIndex -= 1
        } else {
            spoilIndex = worlds[worldNumber].quests[questNumber].spoils.count - 1
        }
        setSpoil()
    }
    
    @IBAction func currentSpoilAction(_ sender: UIButton) {
        
    }
    
    @IBAction func nextSpoilAction(_ sender: UIButton) {
        if (spoilIndex < worlds[worldNumber].quests[questNumber].spoils.count - 1) {
            spoilIndex += 1
        } else {
            spoilIndex = 0
        }
        setSpoil()
    }
    
    @IBAction func storeSpoilAction(_ sender: UIButton) {
        if (worlds[worldNumber].character.addItem(item: worlds[worldNumber].quests[questNumber].spoils[spoilIndex])){
            worlds[worldNumber].quests[questNumber].spoils.remove(at: spoilIndex)
            spoilIndex -= 1
            //If we stored the first item in the array, but there's more to go, kick back the index.
            if (spoilIndex < 0 && worlds[worldNumber].quests[questNumber].spoils.count > 0) {
                spoilIndex += 1
            }
        }
        setSpoil()
    }
    
    @IBAction func equipSpoilAction(_ sender: UIButton) {
        let equip = Equipment(n: worlds[worldNumber].quests[questNumber].spoils[spoilIndex].name, s: worlds[worldNumber].quests[questNumber].spoils[spoilIndex].slot)
        let oldEquip = worlds[worldNumber].character.putOnEquipment(slot: equip.slot, equip: equip)
        if (oldEquip.name != "N/a") {
            worlds[worldNumber].quests[questNumber].spoils[spoilIndex] = oldEquip
        } else {
            spoilIndex -= 1
            //If we equipped the first item in the array, but there's more to go, kick back the index.
            if (spoilIndex < 0 && worlds[worldNumber].quests[questNumber].spoils.count > 0) {
                spoilIndex += 1
            }
        }
        setSpoil()
    }
    
    @IBAction func previousInventoryAction(_ sender: UIButton) {
    }
    
    @IBAction func currentInventoryAction(_ sender: UIButton) {
    }
    
    @IBAction func nextInventoryAction(_ sender: UIButton) {
    }
    
    @IBAction func dropInventoryAction(_ sender: UIButton) {
    }
    
    @IBAction func equipInventoryAction(_ sender: UIButton) {
    }
    
    //A simple function that sets the image and text.
    func setSpoil() {
        //While this if-statement doesn't work well if index < 0 but count > 0, we prevented this in the store button.
        if (spoilIndex > -1 && spoilIndex < worlds[worldNumber].quests[questNumber].spoils.count) {
            currentSpoil.setBackgroundImage(UIImage(named: worlds[worldNumber].quests[questNumber].spoils[spoilIndex].name), for: .normal)
            spoilsResponse.text = worlds[worldNumber].quests[questNumber].spoils[spoilIndex].name
        } else {
            currentSpoil.setBackgroundImage(nil, for: .normal)
            spoilsResponse.text = ""
            equipSpoilButton.isEnabled = false;
            storeSpoilButton.isEnabled = false;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "victoryToStart" {
            
            let nvc = segue.destination as! StartViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            nvc.didSucceed = true
            print("Successfully sent over data, head back to the quest list.")
            
        }
        
    }
    
}
