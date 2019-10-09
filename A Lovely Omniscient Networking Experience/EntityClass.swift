//
//  EntityClass.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/3/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class EntityClass {
    
    /*The intricate stats, determined by those above and your equipment.*/
    var HP: Int = 100
    var EP: Int = 100
    var MP: Int = 100
    /*If any of the above statistics fall to 0, you die.*/
    var maxHP: Int = 100
    var maxEP: Int = 100
    var maxMP: Int = 100
    var accuracy: Int = 0 // 0 means no modifier, but attacks have different accuracies.
    var evasion: Int = 0 //This 0 does means 0% to dodge, but attacks may still miss.
    var quickness: Int = 5 //Relates to a character's quickness on screen, augmenting FPS.
    
    /*Resistances to just about everything.
     *Resistance not only increases the chance of completely negating an effect,
     *but also shortens the length if it happens.*/
    var bleedResist: Int = 0 //Overall defense against HP Damage.
    var physicalResist: Int = 0 //Overall defense against EP Damage.
    var mentalResist: Int = 0 //Overall defense against MP Damage.
    var fireResist: Int = 0 //Fire affects all bars, but specifically MP. More specific?
    var frostResist: Int = 0 //Frost slows you down. Anything else?
    var poisonResist: Int  = 0 //Poisons have varying effects. Sounds about right.
    var stunResist: Int = 0 //Stuns can disable your actions entirely. Anything else?
    //Should there be a debuff resist? Should it replace stun resist?
    
    //Skill sets, for mostly the player - perhaps the enemy?
    var fightingSkills: Array<Skill> = []
    var agriculturalSkills: Array<Skill> = []
    var housekeepingSkills: Array<Skill> = []
    var cookingSkills: Array<Skill> = []
    var smithingSkills: Array<Skill> = []
    var otherSkills: Array<Skill> = []
    
    /*Each entity can be interacted with, or at least examined.*/
    var interactionType: String = "???"
    var interactionName: String = "???"
    
    /*Bodily statistics, for enhanced gameplay.*/
    var bodyTemperature: Int = 3700
    var bodyParts: Array<BodyPart> = []
    /*SOON TO BE REDONE*/
    var chestSlots: Int = 1
    var waistSlots: Int = 1
    var quickSlots: Int = 1
    /*SOON TO BE REDONE*/
    var name: String
    var distance: Int = 0
    /*SOON TO BE REMOVED*/
    var entityTimer: Timer = Timer()
    var entityTime: Int = 0
    //These next few actually are used.
    var actionNumber: Int = 0
    var actions: Array<String> = []
    var walkPhase: Int = 0
    var timeSinceSlept: Int = 60
    //These are new mechanics, need to be implemented.
    var debuffs: Array<Debuff> = []
    var vitamins: Array<Mineral> = []
    var bodyWeight = 70000 //g
    var fat = 13000 //g
    var saturation = 2880 //calories/day
    var hydration = 4320 // mL/day
    
    init (n: String) {
        
        name = n
        
        createEnemy(name: name)
        
    }
    
    //Equips a desired piece of Equipment onto the person
    func putOnEquipment(slot: String, equip: Equipment) -> Equipment {
        //A blank item.
        var returnEquip: Equipment = Equipment(n: "N/a", s: "N/a")
        for bodypart in bodyParts {
            //If the slot of the item matches the body part, switch equipment.
            if (bodypart.name == slot && bodypart.equipped.isEmpty()) {
                //If the item on the bodypart is not null, save it and return it later.
                if (bodypart.equipped.name != "N/a") {
                    returnEquip = bodypart.equipped
                }
                bodypart.equipped = equip
            }
        }
        return returnEquip
    }
    
    //Checks for too much weight on the body.
    func checkExcessWeight() {
        
        /*Excess weight debuffs:
        *Once more than 25% of the total weight is not bodyWeight, start applying debuffs.
        *If fat is the culprit, debuff speed and increase food consumption.
        *If cargo is the culprit, debuff speed alone.
        *An increase in bodyWeight also burns more calories, FYI.*/
        
        var excessWeight = 0
        excessWeight += fat
        for bodypart in bodyParts {
            excessWeight += bodypart.equipped.weight
            for pocket in bodypart.equipped.pockets {
                for pocketItem in pocket.items {
                    excessWeight += pocketItem.weight
                }
            }
        }
        removeDebuff(name: "Minor Excess Weight")
        removeDebuff(name: "Regular Excess Weight")
        removeDebuff(name: "Major Excess Weight")
        removeDebuff(name: "Grand Excess Weight")
        if (bodyWeight / 4 < excessWeight) {
            if (excessWeight * 3 < bodyWeight) {
                if (locateDebuff(name: "Minor Excess Weight") == -1) {
                    let debuff: Debuff = Debuff(n: "Minor Excess Weight",d: -1)
                    debuffs.append(debuff)
                }
            } else if (excessWeight * 2 < bodyWeight) {
                if (locateDebuff(name: "Regular Excess Weight") == -1) {
                    let debuff: Debuff = Debuff(n: "Regular Excess Weight",d: -1)
                    debuffs.append(debuff)
                }
            } else if (excessWeight < bodyWeight) {
                if (locateDebuff(name: "Major Excess Weight") == -1) {
                    let debuff: Debuff = Debuff(n: "Major Excess Weight",d: -1)
                    debuffs.append(debuff)
                }
            } else {
                if (locateDebuff(name: "Grand Excess Weight") == -1) {
                    let debuff: Debuff = Debuff(n: "Grand Excess Weight",d: -1)
                    debuffs.append(debuff)
                }
            }
        }
    }
    
    func removeDebuff (name: String) {
        var count = 0
        
        while (count < debuffs.count) {
            if(debuffs[count].name == name){
                debuffs.remove(at: count)
                break
            }
            count += 1
        }
    }
    
    //Basic, used to determine if the debuff already exists. Can be used to pull out a debuff from the entity's array, as it provides the index from the array.
    func locateDebuff(name: String)-> Int{
        
        var count = 0
        
        for debuff in debuffs {
            if(debuff.name == name){
                return count
            }
            count += 1
        }
        return -1
    }
    
    //Sets the vitamins for the human body - NOT to be used on non-humanoid enemy characters.
    //See the Mineral class for more information on each one.
    func setVitamins() {
        
        let vitaminA = Mineral(n: "Vitamin A")
        vitamins.append(vitaminA)
        let vitaminB1 = Mineral(n: "Vitamin B1")
        vitamins.append(vitaminB1)
        let vitaminB2 = Mineral(n: "Vitamin B2")
        vitamins.append(vitaminB2)
        let vitaminB3 = Mineral(n: "Vitamin B3")
        vitamins.append(vitaminB3)
        let vitaminB5 = Mineral(n: "Vitamin B5")
        vitamins.append(vitaminB5)
        let vitaminB6 = Mineral(n: "Vitamin B6")
        vitamins.append(vitaminB6)
        let vitaminB12 = Mineral(n: "Vitamin B12")
        vitamins.append(vitaminB12)
        let biotin = Mineral(n: "Biotin")
        vitamins.append(biotin)
        let vitaminC = Mineral(n: "Vitamin C")
        vitamins.append(vitaminC)
        let choline = Mineral(n: "Choline")
        vitamins.append(choline)
        let vitaminB9 = Mineral(n: "Vitamin B9")
        vitamins.append(vitaminB9)
        let vitaminD = Mineral(n: "Vitamin D")
        vitamins.append(vitaminD)
        let vitaminE = Mineral(n: "Vitamin E")
        vitamins.append(vitaminE)
        let vitaminK = Mineral(n: "Vitamin K")
        vitamins.append(vitaminK)
        let calcium = Mineral(n: "Calcium")
        vitamins.append(calcium)
        let chloride = Mineral(n: "Chloride")
        vitamins.append(chloride)
        let chromium = Mineral(n: "Chromium")
        vitamins.append(chromium)
        let copper = Mineral(n: "Copper")
        vitamins.append(copper)
        let fluoride = Mineral(n: "Fluoride")
        vitamins.append(fluoride)
        let iodine = Mineral(n: "Iodine")
        vitamins.append(iodine)
        let iron = Mineral(n: "Iron")
        vitamins.append(iron)
        let magnesium = Mineral(n: "Magnesium")
        vitamins.append(magnesium)
        let maganese = Mineral(n: "Maganese")
        vitamins.append(maganese)
        let molybdenum = Mineral(n: "Molybdenum")
        vitamins.append(molybdenum)
        let phosphorus = Mineral(n: "Pohsphorus")
        vitamins.append(phosphorus)
        let potassium = Mineral(n: "Potassium")
        vitamins.append(potassium)
        let selenium = Mineral(n: "Selenium")
        vitamins.append(selenium)
        let sodium = Mineral(n: "Sodium")
        vitamins.append(sodium)
        let sulfur = Mineral(n: "Sulfur")
        vitamins.append(sulfur)
        let zinc = Mineral(n: "Zinc")
        vitamins.append(zinc)
        
    }
    
    //When time passes, use this to set digestion, debuffs, etc. accordingly.
    func timePassed(amount: Int) {
        //Amount is in IRL seconds or in-game minutes.
        if (saturation < 1) {
            saturation = 0
            if (locateDebuff(name: "Starvation") == -1) {
                let debuff = Debuff(n: "Starvation", d: -1)
                debuffs.append(debuff)
            }
        } else {
            removeDebuff(name: "Starvation")
            saturation -= 2
        }
        var count = 0
        //Allows every debuff to be cycled through.
        while (count < debuffs.count) {
            let debuff = debuffs[count]
            var time = 0
            //Allows the debuff to go through every second of effect.
            while (time < amount) {
                //Only decrements if the duration is positive; all indefinite effects stay at -1.
                if (debuff.duration > 0) {
                debuff.duration -= 1
                }
                //Apply any active effects, like bleeding.
                debuff.activeEffects(entity: self)
                //If the debuff is at 0, get rid of it.
                if (debuff.duration == 0) {
                    debuffs.remove(at: count)
                }
                time += 1
            }
            count += 1
        }
        //We still need to create a function that applies the effects to HP, MP, EP, etc.
        
        for vitamin in vitamins {
            
            let decrement = amount * vitamin.dispersionRate / (60*24)
            vitamin.amount -= decrement
            vitamin.testMineral()
            
        }
        
    }
    
    //Adds an item to the player's inventory, if possible.
    func addItem(item: Item) -> Bool {
        var didFindPocket = false
        for part in bodyParts {
            for pocket in part.equipped.pockets {
                if (item.size + pocket.checkSize() < pocket.maxSize && item.weight + pocket.checkWeight() < pocket.maxWeight) {
                    pocket.items.append(item)
                    didFindPocket = true
                    break
                }
            }
            if (didFindPocket) {
                print("Successfully added the item!")
                break
            }
        }
        return didFindPocket
    }
    
    //Losing 60% of one's blood leads to exsanguation: this threshold is represented by the max HP. For example, humans have five liters of blood, but losing three leads to death.
    func createEnemy (name: String) {
        
        if (name == "Matthew Jakimovski") {
            
            //Statistics
            maxHP = 5000 * 3 / 5
            maxEP = 2880
            maxMP = 4320
            HP = maxHP
            EP = maxEP
            MP = maxMP
            accuracy = 0
            quickness = 10
            evasion = 25
            //Actions
            actions.append("Stand")
            actions.append("Move Forward")
            actions.append("Attack")
            //Body Parts
            let head = BodyPart(n: "Head")
            bodyParts.append(head)
            let neck = BodyPart(n: "Neck")
            bodyParts.append(neck)
            let leftHand = BodyPart(n: "Left Hand")
            bodyParts.append(leftHand)
            let rightHand = BodyPart(n: "Right Hand")
            bodyParts.append(rightHand)
            let mainHand = BodyPart(n: "Main Hand")
            bodyParts.append(mainHand)
            let offHand = BodyPart(n: "Off Hand")
            bodyParts.append(offHand)
            let torso = BodyPart(n: "Torso")
            bodyParts.append(torso)
            let legs = BodyPart(n: "Legs")
            bodyParts.append(legs)
            let hips = BodyPart(n: "hips")
            bodyParts.append(hips)
            let leftFoot = BodyPart(n: "Left Foot")
            bodyParts.append(leftFoot)
            let rightFoot = BodyPart(n: "Right Foot")
            bodyParts.append(rightFoot)
            //Base Equipment
            let knife = Equipment(n: "Shoddy Kitchen Knife",s: "Main Hand")
            knife.setStats()
            putOnEquipment(slot: knife.slot, equip: knife)
            let leftGlove = Equipment(n: "Shoddy Leather Glove",s: "Left Hand")
            leftGlove.setStats()
            putOnEquipment(slot: leftGlove.slot, equip: leftGlove)
            let clothJerkin = Equipment(n: "Shoddy Cloth Jerkin",s: "Chest")
            clothJerkin.setStats()
            putOnEquipment(slot: clothJerkin.slot, equip: clothJerkin)
            let hammerShorts = Equipment(n: "Shoddy Cloth Hammer Shorts",s: "Legs")
            hammerShorts.setStats()
            putOnEquipment(slot: hammerShorts.slot, equip: hammerShorts)
            let leftSock = Equipment(n: "Shoddy Left Cloth Sock",s: "Left Foot")
            leftSock.setStats()
            putOnEquipment(slot: leftSock.slot, equip: leftSock)
            let rightSock = Equipment(n: "Shoddy Right Cloth Shoe",s: "Right Foot")
            rightSock.setStats()
            putOnEquipment(slot: rightSock.slot, equip: rightSock)
            //Adding on all of the vitamins a human needs.
            setVitamins()
            //Adding items to the pockets.
            let specialtyCopperPugio: Item = Item(n: "Specialty Copper Pugio", s: "Main Hand")
            addItem(item: specialtyCopperPugio)
            let standardCopperKnife: Item = Item(n: "Shoddy Kitchen Knife", s: "Main Hand")
            addItem(item: standardCopperKnife)
            //Interactions:
            interactionType = "Examination"
            interactionName = "Matthew Jakimovski"
            
        } else if (name == "Brown Rat") {
            //Statistics
            maxHP = 64 * 3 / 5
            maxEP = 50
            maxMP = 100
            accuracy = 0
            quickness = 9
            evasion = 25
            //Actions
            actions.append("Sprint Leftward")
            actions.append("Attack")
            actions.append("Sprint Rightward")
            actions.append("Stand")
            //Body Parts
            let head = BodyPart(n: "Head")
            bodyParts.append(head)
            let torso = BodyPart(n: "Torso")
            bodyParts.append(torso)
            let mainHand = BodyPart(n: "Main Hand")
            bodyParts.append(mainHand)
            //Equipment
            let claws = Equipment(n: "Rat Claws",s: "Main Hand")
            claws.setStats()
            putOnEquipment(slot: claws.slot, equip: claws)
            
        } else if (name == "Brown Doe") {
            //Statistics
            maxHP = 4730 * 3 / 5
            maxEP = 2365
            maxMP = 473
            accuracy = 0
            quickness = 26
            evasion = 20
            //Actions
            actions.append("Stand")
            actions.append("Run Rightward")
            
        } else if (name == "Grey Doe") {
            //Statistics
            maxHP = 4730 * 3 / 5
            maxEP = 2365
            maxMP = 473
            accuracy = 0
            quickness = 26
            evasion = 20
            //Actions
            actions.append("Stand")
            actions.append("Run Rightward")
            
        } else if (name == "Cream Doe") {
            //Statistics
            maxHP = 4730 * 3 / 5
            maxEP = 2365
            maxMP = 473
            accuracy = 0
            quickness = 26
            evasion = 20
            //Actions
            actions.append("Stand")
            actions.append("Run Rightward")
            
        } else if (name == "White Doe") {
            //Statistics
            maxHP = 4730 * 3 / 5
            maxEP = 2365
            maxMP = 473
            accuracy = 0
            quickness = 26
            evasion = 20
            //Actions
            actions.append("Stand")
            actions.append("Run Rightward")
            
        }
       
    }
}
