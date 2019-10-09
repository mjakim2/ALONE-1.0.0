//
//  InventoryViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/20/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {

    @IBOutlet var currentItemButton: UIButton!
    @IBOutlet var responseBar: UILabel!
    //Equipment Views:
    @IBOutlet var headView: UIImageView!
    @IBOutlet var secondaryView: UIImageView!
    @IBOutlet var primaryView: UIImageView!
    @IBOutlet var chestView: UIImageView!
    @IBOutlet var rightHandView: UIImageView!
    @IBOutlet var leftHandView: UIImageView!
    @IBOutlet var legsView: UIImageView!
    @IBOutlet var rightFootView: UIImageView!
    @IBOutlet var leftFootView: UIImageView!
    //Fluids:
    @IBOutlet var bloodFluid: UIView!
    @IBOutlet var energyFluid: UIView!
    @IBOutlet var mindFluid: UIView!
    
    var worlds: Array<WorldClass> = []
    var worldNumber: Int = 0
    //These three variables help manage sifting through your inventory.
    var bodyIndex: Int = -1
    var pocketIndex: Int = -1
    var contentIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseBar.text = ""
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
                        print("Found a pocket with items!")
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
        currentItemButton.setBackgroundImage(UIImage(named: worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items[contentIndex].name)!, for: .normal)
            print("Set up the image!")
        }
        //And finally, we set the imagery of the equipment.
        setImagery()
    }
    //Sifts to the next item in all of your pockets. Will also switch out of pockets.
    @IBAction func previousItemAction(_ sender: UIButton) {
        //Checks if we ever had items in our inventory to begin with, using data from the initializer.
        if (bodyIndex > -1) {
            //If we won't go out of bounds, change the item we're on and end the function.
            if (contentIndex > 0) {
                contentIndex -= 1
            } else {
                //If there's no more to go on that pocket, enter a loop that investigates the rest of the body for more items.
                var count = 0
                while (count <= worlds[worldNumber].character.bodyParts.count) {
                    //If there are more pockets left to go on this particular equipment, enter another pocket.
                    if (pocketIndex > 0) {
                        pocketIndex -= 1
                        //If this new pocket happens to have more items, set the contentIndex and exit the loop.
                        if (worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items.count > 0) {
                            contentIndex = worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items.count - 1
                            break
                        }
                    } else {
                        //If we ran out of pockets on that piece of equipment, go to the next body part.
                        if (bodyIndex > 0) {
                            bodyIndex -= 1
                        } else {
                            bodyIndex = worlds[worldNumber].character.bodyParts.count - 1
                        }
                        pocketIndex = worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets.count - 1
                        //After switching to a new body part (and pocket), look for more items.
                        if (pocketIndex > -1 && worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items.count > 0) {
                            contentIndex = worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items.count - 1
                            break
                        }
                    }
                    //Increment this variable so we don't end up looping forever.
                    count += 1
                }
            }
            //Display the new item.
            currentItemButton.setBackgroundImage(UIImage(named: worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items[contentIndex].name)!, for: .normal)
        }
    }
    //Will examine the item selected.
    @IBAction func currentItemAction(_ sender: UIButton) {
        
    }
    //Sifts to the previous item throughout all your pockets. Will switch between pockets if necessary.
    @IBAction func nextItemAction(_ sender: UIButton) {
        //Checks if we ever had items in our inventory to begin with, using data from the initializer.
        if (bodyIndex > -1) {
            //If we won't go out of bounds, change the item we're on and end the function.
            if (contentIndex < worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items.count - 1) {
                contentIndex += 1
            } else {
                //If there's no more to go on that pocket, enter a loop that investigates the rest of the body for more items.
                var count = 0
                while (count <= worlds[worldNumber].character.bodyParts.count) {
                    //If there are more pockets left to go on this particular equipment, enter another pocket.
                    if (pocketIndex < worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets.count - 1) {
                        pocketIndex += 1
                        //If this new pocket happens to have more items, set the contentIndex and exit the loop.
                        if (worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items.count > 0) {
                            contentIndex = 0
                            break
                        }
                    } else {
                        //If we ran out of pockets on that piece of equipment, go to the next body part.
                        if (bodyIndex < worlds[worldNumber].character.bodyParts.count - 1) {
                            bodyIndex += 1
                        } else {
                            bodyIndex = 0
                        }
                        pocketIndex = 0
                        //After switching to a new body part (and pocket), look for more items.
                        if (worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets.count > 0 && worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items.count > 0) {
                            contentIndex = 0
                            break
                        }
                    }
                    //Increment this variable so we don't end up looping forever.
                    count += 1
                }
            }
            //Display the new item.
            currentItemButton.setBackgroundImage(UIImage(named: worlds[worldNumber].character.bodyParts[bodyIndex].equipped.pockets[pocketIndex].items[contentIndex].name)!, for: .normal)
        }
    }
    //Empties the contents of your person?
    @IBAction func emptyAction(_ sender: UIButton) {
        
    }
    //Equips the selected item, but only if all the pockets of the item to be replaced are empty.
    @IBAction func equipAction(_ sender: UIButton) {
        
    }
    //Drops the selected item, deleting it permanently.
    @IBAction func dropAction(_ sender: UIButton) {
        
    }
    
    //Gives the current item we're looking at in the inventory screen.
    func currentItem() {
        
    }
    
    //Sets the character's image.
    func setImagery() {
        for bodyPart in worlds[worldNumber].character.bodyParts {
            if (bodyPart.equipped.slot == "Left Foot") {
                leftFootView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Right Foot") {
                rightFootView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Legs") {
                legsView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Chest") {
                chestView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Head") {
                headView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Left Hand") {
                leftHandView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Right Hand") {
                rightHandView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Primary") {
                primaryView.image = UIImage(named: bodyPart.equipped.name)
            } else if (bodyPart.equipped.slot == "Secondary") {
                secondaryView.image = UIImage(named: bodyPart.equipped.name)
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       if segue.identifier == "inventoryToStart" {
            
            let nvc = segue.destination as! StartViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed from the inventory to the quests list.")
            
       } else if segue.identifier == "inventoryToCrafting" {
        
        let nvc = segue.destination as! CraftingViewController
        nvc.worlds = worlds
        nvc.worldNumber = worldNumber
        print("Successfully sent over data, headed from the inventory to the crafting table.")
        
        }
    }
    
}
