//
//  BattleViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/19/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {

    //Action Buttons
    @IBOutlet var previousActionButton: UIButton!
    @IBOutlet var actionButton: UIButton!
    @IBOutlet var nextActionButton: UIButton!
    
    //Jars & Fluids
    @IBOutlet var bloodFluid: UIView!
    @IBOutlet var energyFluid: UIView!
    @IBOutlet var mindFluid: UIView!
    
    //Quickslot Buttons
    @IBOutlet var previousSlot: UIButton!
    @IBOutlet var nextSlot: UIButton!
    @IBOutlet var useSlot: UIButton!
    
    //Character Imagery
    @IBOutlet var leftFootImage: UIImageView!
    @IBOutlet var rightFootImage: UIImageView!
    @IBOutlet var legsImage: UIImageView!
    @IBOutlet var torsoImage: UIImageView!
    @IBOutlet var leftHandImage: UIImageView!
    @IBOutlet var rightHandImage: UIImageView!
    @IBOutlet var headImage: UIImageView!
    @IBOutlet var primaryImage: UIImageView!
    @IBOutlet var secondaryImage: UIImageView!
    
    //Other Imagery
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var skyImage: UIImageView!
    
    //A combination of carried-over data and newly-created variables.
    var worlds: Array<WorldClass> = []
    var worldNumber: Int = 1
    var questNumber: Int = 1
    var seconds: Int = 0
    var act: Int = 0
    var backgroundPhase: Int = 0
    var commit: Bool = false
    var enemyImages: Array<UIImageView> = []
    var shop: Shop = Shop(n: "N/a", i: [], p: [], a: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Clear any images from previous battles.
        worlds[worldNumber].quests[questNumber].enemies.removeAll()
        enemyImages.removeAll()
        worlds[worldNumber].character.distance = 100
        
        //Initially set up the character's image.
        leftFootImage.image = UIImage(named: "ClothSockWalking00")
        rightFootImage.image = UIImage(named: "ClothSockWalking10")
        legsImage.image = UIImage(named: "ClothHammerShortsWalking00")
        setActionImage()
        setSky(time: worlds[worldNumber].time)
        updateBars()
        
        view.backgroundColor = worlds[worldNumber].color
        
        if(worlds[worldNumber].quests[questNumber].name == "Baker's Tutorial"){
            
            //Installing the rats into the tutorial:
            var counter = 1
            while (counter <= 5) {
                
                let rat = EntityClass(n: "Brown Rat")
                rat.distance = Int(80 + arc4random_uniform(40)) * counter + 300
                let ratImage = UIImageView(image: UIImage(named: "BrownRat00"))
                ratImage.frame = CGRect(x: 0, y: 0, width: torsoImage.bounds.width, height: torsoImage.bounds.height)
                view.addSubview(ratImage)
                ratImage.isHidden = false
                ratImage.center.x = CGFloat(rat.distance - worlds[worldNumber].character.distance + 142)
                ratImage.center.y = torsoImage.center.y
                worlds[worldNumber].quests[questNumber].enemies.append(rat)
                enemyImages.append(ratImage)
                counter += 1;
            }
            
        } else if (worlds[worldNumber].quests[questNumber].name == "Day Hunting"){
            
            //Installing the rats into the tutorial:
            var counter = 1
            while (counter <= 5) {
                
                let doe = EntityClass(n: "Brown Doe")
                doe.distance = Int(150 + arc4random_uniform(100)) * counter + 300
                let doeImage = UIImageView(image: UIImage(named: "BrownDoe00"))
                doeImage.frame = CGRect(x: 0, y: 0, width: torsoImage.bounds.width, height: torsoImage.bounds.height)
                view.addSubview(doeImage)
                doeImage.isHidden = false
                doeImage.center.x = CGFloat(doe.distance - worlds[worldNumber].character.distance + 142)
                doeImage.center.y = torsoImage.center.y
                worlds[worldNumber].quests[questNumber].enemies.append(doe)
                enemyImages.append(doeImage)
                print("The number of images in enemyImages is \(enemyImages.count).")
                counter += 1;
            }
            
        } else if (worlds[worldNumber].quests[questNumber].name == "Dusk Hunting"){
            
            //Installing the rats into the tutorial:
            var counter = 1
            while (counter <= 5) {
                
                let doe = EntityClass(n: "Brown Doe")
                doe.distance = 100 * counter + 300
                let doeImage = UIImageView(image: UIImage(named: "BrownDoe00"))
                doeImage.frame = CGRect(x: 0, y: 0, width: torsoImage.bounds.width, height: torsoImage.bounds.height)
                view.addSubview(doeImage)
                doeImage.isHidden = false
                doeImage.center.x = CGFloat(doe.distance - worlds[worldNumber].character.distance + 142)
                doeImage.center.y = torsoImage.center.y
                worlds[worldNumber].quests[questNumber].enemies.append(doe)
                enemyImages.append(doeImage)
                counter += 1;
            }
            
        } else if (worlds[worldNumber].quests[questNumber].name == "Dark Hunting"){
            
            //Installing the rats into the tutorial:
            var counter = 1
            while (counter <= 5) {
                
                let doe = EntityClass(n: "Brown Doe")
                doe.distance = 100 * counter + 300
                let doeImage = UIImageView(image: UIImage(named: "BrownDoe00"))
                doeImage.frame = CGRect(x: 0, y: 0, width: torsoImage.bounds.width, height: torsoImage.bounds.height)
                view.addSubview(doeImage)
                doeImage.isHidden = false
                doeImage.center.x = CGFloat(doe.distance - worlds[worldNumber].character.distance + 142)
                doeImage.center.y = torsoImage.center.y
                worlds[worldNumber].quests[questNumber].enemies.append(doe)
                enemyImages.append(doeImage)
                
            }
            
        } else if (worlds[worldNumber].quests[questNumber].name == "Dawn Hunting"){
            
            //Installing the rats into the tutorial:
            var counter = 1
            while (counter <= 5) {
                
                let doe = EntityClass(n: "Brown Doe")
                doe.distance = 100 * counter + 300
                let doeImage = UIImageView(image: UIImage(named: "BrownDoe00"))
                doeImage.frame = CGRect(x: 0, y: 0, width: torsoImage.bounds.width, height: torsoImage.bounds.height)
                view.addSubview(doeImage)
                doeImage.isHidden = false
                doeImage.center.x = CGFloat(doe.distance - worlds[worldNumber].character.distance + 142)
                doeImage.center.y = torsoImage.center.y
                worlds[worldNumber].quests[questNumber].enemies.append(doe)
                enemyImages.append(doeImage)
                counter += 1;
            }
            
        } else if (worlds[worldNumber].quests[questNumber].name == "Cavesin Graveyard") {
            
            var counter = 1;
            
            while (counter <= 5) {
            
                let skull = EntityClass(n: "Graveyard Skull")
                skull.distance = 200 * counter + 300
                let skullImage = UIImageView(image: UIImage(named: "GraveyardSkull00"))
                skullImage.frame = CGRect(x: 0, y: 0, width: torsoImage.bounds.width, height: torsoImage.bounds.height)
                view.addSubview(skullImage)
                skullImage.isHidden = false
                skullImage.center.x = CGFloat(skull.distance - worlds[worldNumber].character.distance + 142)
                skullImage.center.y = torsoImage.center.y
                worlds[worldNumber].quests[questNumber].enemies.append(skull)
                enemyImages.append(skullImage)
            
                counter += 1;
                
            }
            
        }
        
        //Putting in the background
        backgroundImage.image = backgroundMovingImage(phase: 0)
        
        //Start the clock
        if(worlds[worldNumber].worldTimer == nil){
            print("The timer is nil, setting timer.")
            worlds[worldNumber].worldTimer = Timer.scheduledTimer(timeInterval: 1/1000, target: self, selector: #selector(BattleViewController.advanceTime), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        act += 1
        if act > worlds[worldNumber].character.actions.count - 1 {
            act = 0
        }
        commit = false
        setActionImage()
    }
    
    @IBAction func previousAction(_ sender: UIButton) {
        act -= 1
        if act < 0 {
            act = worlds[worldNumber].character.actions.count - 1
        }
        commit = false
        setActionImage()
    }
    
    @IBAction func commitAction(_ sender: UIButton) {
        
        commit = true
        
    }
    
    @IBAction func previousSlotAction(_ sender: UIButton) {
        
    }
    
    @IBAction func useSlotAction(_ sender: UIButton) {
    }
    
    @IBAction func nextSlotAction(_ sender: UIButton) {
    }
    
    //until action images are create, use strings.
    func actionLabel(){
    actionButton.setTitle(worlds[worldNumber].character.actions[worlds[worldNumber].character.actionNumber], for: .normal)
    }
    
    //Given the time change, test whether this quest should end.
    func shouldQuit() -> Bool {
        let time: Int = worlds[worldNumber].time
        let ends: String = worlds[worldNumber].quests[questNumber].ends
        if (ends == "Phase") {
            if (time == 60*8 || time == 60*16 || time == 60*20 || time == 60*4) {
                return true;
            }
            return false;
        } else if (ends == "Day") {
            if (time == 60*8) {
                return true;
            }
            return false;
        } else if (ends == "Dusk") {
            if (time == 60*16) {
                return true;
            }
            return false;
        } else if (ends == "Dark") {
            if (time == 60*20) {
                return true;
            }
            return false;
        } else if (ends == "Dawn") {
            if (time == 60*4) {
                return true;
            }
            return false;
        }
        return false;
    }
    
    //Gives AI to the enemy, decision-making and the like.
    func enemyDecision(enemy: EntityClass){
        
        if(enemy.name == "Brown Rat"){
            
            if(worlds[worldNumber].character.distance > enemy.distance){
                
                //Enable the rat's backward movement
                enemy.actionNumber = 2
                
            } else if (worlds[worldNumber].character.distance + Int(leftFootImage.center.x) / 2 > enemy.distance){
                
                //Enable the rat's attack mode
                enemy.actionNumber = 1
                
            } else if (worlds[worldNumber].character.distance + Int(leftFootImage.center.x) * 5 > enemy.distance){
                
                //Enable the rat's forward movement
                enemy.actionNumber = 0
                
            } else {
                
                //Don't move the rat!
                enemy.actionNumber = 3
                
            }
            
        } else if(enemy.name == "Brown Doe" || enemy.name == "Gray Doe" || enemy.name == "Cream Doe" || enemy.name == "White Doe"){
            
            if(worlds[worldNumber].character.distance + Int(leftFootImage.center.x) * 2 > enemy.distance){
                
                //Enable the doe's rightward movement
                enemy.actionNumber = 1
                
            } else {
                
                //Don't move the doe!
                enemy.actionNumber = 0
                
            }
            
        } else if(enemy.name == "Graveyard Skull"){
            
            if(worlds[worldNumber].character.distance > enemy.distance){
                
                //Enable the skull's backward movement
                enemy.actionNumber = 2
                
            } else if (worlds[worldNumber].character.distance + Int(leftFootImage.center.x) / 2 > enemy.distance){
                
                //Enable the skull's attack mode
                enemy.actionNumber = 1
                
            } else if (worlds[worldNumber].character.distance + Int(leftFootImage.center.x) * 5 > enemy.distance){
                
                //Enable the skull's forward movement
                enemy.actionNumber = 0
                
            } else {
                
                //Don't move the skull!
                enemy.actionNumber = 3
                
            }
            
        }
        
        if(enemy.HP <= 0 || enemy.EP <= 0 || enemy.MP <= 0){
            //If the enemy's dead, it cannot take anymore actions - initiate death sequence.
            enemy.actions.removeAll()
            enemy.actions.append("Die")
            enemy.actionNumber = 0
            
        }
        
    }
    
    //Sums up a stat for dealing damage, resisting, and the like.
    func summarizeStat(entity: EntityClass,statistic: String) -> Int {
        
        var sum: Int = 0
        
        if(statistic == "HP Resist"){
            
            sum += entity.bleedResist
            
            for item in entity.bodyParts {
                sum += item.equipped.bleedResist
            }
            for debuff in entity.debuffs {
                sum += debuff.bleedResist
            }
            
        } else if (statistic == "EP Resist"){
            
            sum += entity.physicalResist
            
            for item in entity.bodyParts {
                sum += item.equipped.physicalResist
            }
            for debuff in entity.debuffs {
                sum += debuff.physicalResist
            }
            
        } else if (statistic == "MP Resist"){
            
            sum += entity.mentalResist
            
            for item in entity.bodyParts {
                sum += item.equipped.mentalResist
            }
            for debuff in entity.debuffs {
                sum += debuff.mentalResist
            }
            
        } else if (statistic == "Frost"){
            
            sum += entity.frostResist
            
            for item in entity.bodyParts {
                sum += item.equipped.frostResist
            }
            for debuff in entity.debuffs {
                sum += debuff.frostResist
            }
            
        } else if (statistic == "Poison"){
            
            sum += entity.poisonResist
            
            for item in entity.bodyParts {
                sum += item.equipped.poisonResist
            }
            for debuff in entity.debuffs {
                sum += debuff.poisonResist
            }
            
        } else if (statistic == "Fire"){
            
            sum += entity.fireResist
            
            for item in entity.bodyParts {
                sum += item.equipped.fireResist
            }
            for debuff in entity.debuffs {
                sum += debuff.fireResist
            }
            
        } else if (statistic == "Stun"){
            
            sum += entity.stunResist
            
            for item in entity.bodyParts {
                sum += item.equipped.stunResist
            }
            for debuff in entity.debuffs {
                sum += debuff.stunResist
            }
            
        } else if (statistic == "HP Damage"){
            
            for item in entity.bodyParts {
                sum += Int(arc4random_uniform(UInt32(item.equipped.maxHPDMG - item.equipped.minHPDMG + 1)) + UInt32(item.equipped.minHPDMG))
            }
            
        } else if (statistic == "EP Damage"){
            
            for item in entity.bodyParts {
                sum += Int(arc4random_uniform(UInt32(item.equipped.maxEPDMG - item.equipped.minEPDMG + 1)) + UInt32(item.equipped.minEPDMG))
            }
            
        } else if (statistic == "MP Damage"){
            
            for item in entity.bodyParts {
                sum += Int(arc4random_uniform(UInt32(item.equipped.maxMPDMG - item.equipped.minMPDMG + 1)) + UInt32(item.equipped.minMPDMG))
            }
            
        } else if (statistic == "Accuracy"){
                
            sum += entity.accuracy
                
            for item in entity.bodyParts {
                sum += item.equipped.accuracy
            }
            for debuff in entity.debuffs {
                sum += debuff.accuracy
            }
                
        } else if (statistic == "Evasion"){
                
            sum += entity.evasion
            for item in entity.bodyParts {
                sum += item.equipped.evasion
            }
            for debuff in entity.debuffs {
                sum += debuff.evasion
            }
                
        }
        return sum
    }
    
    //Updates the HP, EP, and MP bars of the player.
    func updateBars(){
        
        bloodFluid.frame.size.height = CGFloat(104 * worlds[worldNumber].character.HP / worlds[worldNumber].character.maxHP)
        energyFluid.frame.size.height = CGFloat(104 * worlds[worldNumber].character.EP / worlds[worldNumber].character.maxEP)
        mindFluid.frame.size.height = CGFloat(104 * worlds[worldNumber].character.MP / worlds[worldNumber].character.maxMP)
        
    }
    
    func setActionImage(){
        var name = ""
        if(worlds[worldNumber].character.actions[act] == "Stand"){
            
            actionButton.setBackgroundImage(UIImage(named: "Shoddy Right Cloth Shoe"), for: .normal)
            name = "Stand"
            print("Stand Still")
            
        } else if(worlds[worldNumber].character.actions[act] == "Move Forward"){
            
            actionButton.setBackgroundImage(UIImage(named: "Shoddy Left Cloth Shoe"), for: .normal)
            name = "Forward"
            print("Move Forward")
            
        } else {/*if(worlds[worldNumber].character.actions[act] == "Attack")*/
            
            actionButton.setBackgroundImage(UIImage(named: "Shoddy Kitchen Knife"), for: .normal)
            name = "Attack"
            print("Stabby")
            
        }
        print(name)
        actionButton.setTitle(name, for: .normal)
    }
    
    //Finds an item on an entity.
    func findItem(entity: EntityClass, slot: String) -> Item{
        
        let item = Item(n: "Null", s: "Null")
        
        for bodyPart in entity.bodyParts{
        
            if (bodyPart.equipped.slot == slot){
            
                return bodyPart.equipped
            
            }
        }
        
        return item
        
    }
    
    //Enacts the attack check of a given enemy.
    func enemyAttack(enemy: EntityClass){
        
        let player = worlds[worldNumber].character!
        
        let netAccuracy = summarizeStat(entity: enemy, statistic: "Accuracy") - player.evasion
            
        if(arc4random_uniform(100) < netAccuracy){
                
            var baseHPDamage = summarizeStat(entity: enemy, statistic: "HP Damage")
            var baseEPDamage = summarizeStat(entity: enemy, statistic: "EP Damage")
            var baseMPDamage = summarizeStat(entity: enemy, statistic: "MP Damage")
                
            let HPCritChance = summarizeStat(entity: enemy, statistic: "HP Crit")
            let EPCritChance = summarizeStat(entity: enemy, statistic: "EP Crit")
            let MPCritChance = summarizeStat(entity: enemy, statistic: "MP Crit")
                
            if(arc4random_uniform(100) < HPCritChance){
                baseHPDamage *= 2
            }
            if(arc4random_uniform(100) < EPCritChance){
                baseEPDamage *= 2
            }
            if(arc4random_uniform(100) < MPCritChance){
                baseMPDamage *= 2
            }
                
            print("They Hit!")
            let damageHP: Int = Int(baseHPDamage * (1 - (summarizeStat(entity: player, statistic: "HP Resist")/100)))
            let damageEP: Int = Int(baseEPDamage * (1 - (summarizeStat(entity: player, statistic: "EP Resist")/100)))
            let damageMP: Int = Int(baseMPDamage * (1 - (summarizeStat(entity: player, statistic: "MP Resist")/100)))
                
            player.HP -= damageHP
            player.EP -= damageEP
            player.MP -= damageMP
                
            print("The player's HP is \(player.HP).\nThe player's EP is \(player.EP).\nThe player's MP is \(player.MP).")
            
            if (enemy.name == "Brown Rat") {
                
                if(arc4random_uniform(100) < summarizeStat(entity: player, statistic: "Bleed Resist")){
                    let bleeding = Debuff(n: "Bleeding",d: 12)//Erik's Recommnedation based on a rat bite bleeding four times worse than a paper cut.
                    player.debuffs.append(bleeding)
                }
                
                let ratBite = Debuff(n: "Rat Bite",d: 120)
                player.debuffs.append(ratBite)
                
            }
                
        } else {
            
            print("Dodge!")
            
        }
            
        
        checkIfPlayerDead()
    }
    
    //Enacts the actions of a given enemy.
    func enemyAction(index: Int){
        let enemy = worlds[worldNumber].quests[questNumber].enemies[index]
        
        let player = worlds[worldNumber].character!
        
        if (enemy.actions[enemy.actionNumber] == "Attack") {
            
            enemyImages[index].image = enemyAttackingImage(phase: enemy.walkPhase, enemy: enemy.name)
            
            if (enemy.name == "Brown Rat") {
                if(enemy.walkPhase >= enemy.beginFrame && enemy.walkPhase <= enemy.endFrame){
                    enemy.distance -= 10;
                } else if(enemy.walkPhase > 8){
                    enemy.distance += 5;
                }
            }
            
            let enemyRange: Int = Int(Double(leftFootImage.bounds.width) * (enemy.entityRange))
            print(enemyRange)
            if((enemy.walkPhase >= enemy.beginFrame && enemy.walkPhase <= enemy.endFrame) && (enemy.distance - player.distance < enemyRange && enemy.distance - player.distance > -1 * enemyRange)){
                
                print("In range...")
                enemyAttack(enemy: enemy)
                updateBars()
                checkIfPlayerDead()
                
            }
                    
            enemyImages[index].center.x = CGFloat(enemy.distance - player.distance + 142)
                    
        } else if (enemy.actions[enemy.actionNumber] == "Walk Rightward") {
            
            enemyImages[index].image = enemyRightwardImage(phase: enemy.walkPhase % 4, enemy: enemy.name)
            
            enemy.distance += Int(Double(enemy.quickness) * 0.27)
            
            enemyImages[index].center.x = CGFloat(142 + enemy.distance - player.distance)
            
        } else if (enemy.actions[enemy.actionNumber] == "Walk Leftward"){

            enemyImages[index].image = enemyLeftwardImage(phase: enemy.walkPhase % 4, enemy: enemy.name)
            
            enemy.distance -= Int(Double(enemy.quickness) * 0.3)
            
            enemyImages[index].center.x = CGFloat(142 + enemy.distance - player.distance)
            
        } else if (enemy.actions[enemy.actionNumber] == "Run Rightward") {
            
            enemyImages[index].image = enemyRightwardImage(phase: enemy.walkPhase % 4, enemy: enemy.name)
            
            enemy.distance += Int(Double(enemy.quickness) * 0.63)
            
            enemyImages[index].center.x = CGFloat(142 + enemy.distance - player.distance)
            
        } else if (enemy.actions[enemy.actionNumber] == "Run Leftward"){
            
            enemyImages[index].image = enemyLeftwardImage(phase: enemy.walkPhase % 4, enemy: enemy.name)
            
            enemy.distance -= Int(Double(enemy.quickness) * 0.7)
            
            enemyImages[index].center.x = CGFloat(142 + enemy.distance - player.distance)
            
        } else if (enemy.actions[enemy.actionNumber] == "Sprint Rightward") {
            
            enemyImages[index].image = enemyRightwardImage(phase: enemy.walkPhase % 5, enemy: enemy.name)
            
            enemy.distance += Int(Double(enemy.quickness) * 0.9)
            
            enemyImages[index].center.x = CGFloat(142 + enemy.distance - player.distance)
            
        } else if (enemy.actions[enemy.actionNumber] == "Sprint Leftward"){
            
            enemyImages[index].image = enemyLeftwardImage(phase: enemy.walkPhase % 5, enemy: enemy.name)
            
            enemy.distance -= Int(Double(enemy.quickness) * 1.0)
            
            enemyImages[index].center.x = CGFloat(142 + enemy.distance - player.distance)
            
        } else if (enemy.actions[enemy.actionNumber] == "Die"){
            
            enemyImages[index].image = enemyDying(phase: enemy.walkPhase, enemy: enemy.name)
            
        } else if (enemy.actions[enemy.actionNumber] == "Stand"){
            
            enemyImages[index].image = enemyLeftwardImage(phase: enemy.walkPhase / 10, enemy: enemy.name)
            enemyImages[index].center.x = CGFloat(142 + enemy.distance - player.distance)
        }
        
    }

    //Enacts the attack of the player.
    func playerAttack(enemy: EntityClass){
        
        let player = worlds[worldNumber].character!
        
        let accuracy = 75 + player.accuracy - enemy.evasion
        let randomNumber = arc4random_uniform(101)
        
        if(randomNumber < accuracy){
            
            var baseHPDamage = summarizeStat(entity: player, statistic: "HP Damage")
            var baseEPDamage = summarizeStat(entity: player, statistic: "EP Damage")
            var baseMPDamage = summarizeStat(entity: player, statistic: "MP Damage")
            
            let HPCritChance = summarizeStat(entity: player, statistic: "HP Crit")
            let EPCritChance = summarizeStat(entity: player, statistic: "EP Crit")
            let MPCritChance = summarizeStat(entity: player, statistic: "MP Crit")
            
            if(arc4random_uniform(101) < HPCritChance){
                baseHPDamage *= 2
            }
            if(arc4random_uniform(101) < EPCritChance){
                baseEPDamage *= 2
            }
            if(arc4random_uniform(101) < MPCritChance){
                baseMPDamage *= 2
            }
            
            print("You Hit!")
            let damageHP: Int = Int(Double(baseHPDamage) * (1 - (Double(summarizeStat(entity: enemy, statistic: "HP Resist"))/100)))
            let damageEP: Int = Int(Double(baseEPDamage) * (1 - (Double(summarizeStat(entity: enemy, statistic: "EP Resist"))/100)))
            let damageMP: Int = Int(Double(baseMPDamage) * (1 - (Double(summarizeStat(entity: enemy, statistic: "MP Resist"))/100)))
                
            enemy.HP -= damageHP
            enemy.EP -= damageEP
            enemy.MP -= damageMP
            
            print("The enemy's HP is \(enemy.HP).\nThe enemy's EP is \(enemy.EP).\nThe enemy's MP is \(enemy.MP).")
            
        } else {
                
            print("They dodged!")
                
        }
        
        
    }
    
    //Sets the color of the sky depending on the time. Useful for determining the function shouldQuit.
    func setSky(time: Int){
        if(time >= 60*8 && time < 60*16){
            skyImage.image = UIImage(named: "Day Sky")
        } else if(time >= 60*16 && time < 60*20){
            skyImage.image = UIImage(named: "Dusk Sky")
        } else if(time >= 60*20 || time < 60*4){
            skyImage.image = UIImage(named: "Dark Sky")
        } else if(time >= 60*4 && time < 60*8){
            skyImage.image = UIImage(named: "Dawn Sky")
        }
    }
    
    //Moves time forward, enacting current player action, enemy actions, and the clock.
    @objc func advanceTime(){
        
        //Increments seconds, and transfers a minute over if seconds == 1000.
        seconds += 1
        if(seconds == 1000){
            worlds[worldNumber].time += 1
            seconds = 0
            setSky(time: worlds[worldNumber].time)
            if(worlds[worldNumber].time == 60*24){
                worlds[worldNumber].time = 0
                worlds[worldNumber].day += 1
            }
            if (worlds[worldNumber].time % 60 == 0) {
                if (shouldQuit()) {
                    print("Time's up!")
                    performSegue(withIdentifier: "toVictory", sender: self)
                }
            }
        }
        
        var counter = 0
        
        while counter < worlds[worldNumber].quests[questNumber].enemies.count {
            
            let enemy = worlds[worldNumber].quests[questNumber].enemies[counter]
            
            if(seconds % (1000/enemy.quickness) == 0){
                
                enemy.walkPhase += 1
                
                if(enemy.walkPhase > 13){
                    enemy.walkPhase = 0
                }
                enemyAction(index: counter)
            }
            
            if(enemy.walkPhase == 0){
                
                //If the enemy's a "dead man walking", this is where they start to die.
                
                if(enemy.actions[enemy.actionNumber] != "Die"){
                    enemyDecision(enemy: enemy)
                }
                
            }
            
            if (enemy.actions[enemy.actionNumber] == "Die" && enemy.walkPhase == 13) {
                
                worlds[worldNumber].quests[questNumber].enemies.remove(at: counter)
                enemyImages[counter].removeFromSuperview()
                enemyImages.remove(at: counter)
                counter -= 1
                
                if(worlds[worldNumber].quests[questNumber].enemies.count == 0){
                    
                    print("You won!")
                    performSegue(withIdentifier: "toVictory", sender: self)
                    
                }
                
            }
            
            counter += 1
        }
        counter = 0
        
        //Increment the phase of which the character is in, and increment distance.
        if (seconds % (1000/worlds[worldNumber].character.quickness) == 0){
            worlds[worldNumber].character.walkPhase += 1
            if worlds[worldNumber].character.actions[worlds[worldNumber].character.actionNumber] == "Move Forward" {
                worlds[worldNumber].character.distance += Int(Double(worlds[worldNumber].character.quickness) * 0.3)
            }
            if (worlds[worldNumber].character.walkPhase == 20){
                worlds[worldNumber].character.walkPhase = 0
            }
            
            if worlds[worldNumber].character.actions[worlds[worldNumber].character.actionNumber] == "Stand" {
                //If Stand is selected, stand still.
                headImage.image = UIImage(named: "HairMoving00")
                torsoImage.image = UIImage(named: "ClothJerkinRightward00")
                legsImage.image = UIImage(named: "ClothHammerShortsRightward00")
                leftFootImage.image = UIImage(named: "ClothSockRightward09")
                rightFootImage.image = UIImage(named: "ClothSockRightward19")
                
            } else if worlds[worldNumber].character.actions[worlds[worldNumber].character.actionNumber] == "Attack" {
                //If Attack is selected, start an attacking animaton.
                let phase = worlds[worldNumber].character.walkPhase;
                
                primaryImage.image = playerAttackingImage(phase: phase, equip: "Shoddy Kitchen Knife")
                torsoImage.image = playerAttackingImage(phase: phase, equip: "Cloth Jerkin")
                leftHandImage.image = playerAttackingImage(phase: phase, equip: "Shoddy Left Leather Glove")
                
                headImage.image = playerAttackingImage(phase: 0, equip: "Hair")
                legsImage.image = UIImage(named: "ClothHammerShortsRightward00")
                leftFootImage.image = UIImage(named: "ClothSockRightward09")
                rightFootImage.image = UIImage(named: "ClothSockRightward19")
                
                //Player weapons pierce through enemies.
                for enemy in worlds[worldNumber].quests[questNumber].enemies {
                    
                    if((worlds[worldNumber].character.walkPhase == 11) && (enemy.distance - worlds[worldNumber].character.distance > 20 && enemy.distance - worlds[worldNumber].character.distance < 60)){
                        
                        print("In range...")
                        playerAttack(enemy: enemy)
                        
                    }
                    
                }
            } else if worlds[worldNumber].character.actions[worlds[worldNumber].character.actionNumber] == "Move Forward" {
                //If Move Forward is selected, start a walking animation.
                
                
                //Change the background
                if(seconds % (1000/worlds[worldNumber].character.quickness) == 0){
                    backgroundPhase += 1
                }
                if(backgroundPhase > 17){
                    backgroundPhase = 0
                }
                backgroundImage.image = backgroundMovingImage(phase: backgroundPhase)
                
                // worlds[worldNumber].character.distance += 10
                
                var phase = worlds[worldNumber].character.walkPhase;
                
                //Set the legs image. NEEDS FIXING
                
                legsImage.image = playerRightwardImage(phase: phase, equip: "Cloth Hammer Shorts")
                
                //Set the torso image.
                
                torsoImage.image = playerRightwardImage(phase: phase, equip: "Cloth Jerkin")
                
                //Set the Head image.
                
                headImage.image = playerRightwardImage(phase: ((phase / 5) % 2), equip: "Hair")
                
                //Correct the phase for bimodal movement.
                
                if(phase >= 10){
                    phase -= 10;
                }
                
                //Set the feet's image. NEEDS FIXING
                
                leftFootImage.image = playerRightwardImage(phase: phase, equip: "Cloth Sock")
                rightFootImage.image = playerRightwardImage(phase: 10 + phase, equip: "Cloth Sock")
                
                
            }
        }
        
        if(worlds[worldNumber].character.walkPhase == 0 && commit){
            worlds[worldNumber].character.actionNumber = act
            commit = false
        }
    }
    
    func checkIfPlayerDead(){
        
        let player = worlds[worldNumber].character!
        
        if(player.HP <= 0 || player.EP <= 0 || player.MP <= 0){
            
            print("YOU DIED")
            player.HP = player.maxHP
            player.EP = player.maxEP
            player.MP = player.maxMP
            performSegue(withIdentifier: "backToMenu", sender: self)
            
        }
        
    }
    
    func enemyDying(phase:Int,enemy: String) -> UIImage{
        
        var image = UIImage(named: "BrownRatDying00")
        
        switch(phase){
            
        case 0:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying00")!
            }
        case 1:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying01")!
            }
        case 2:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying02")!
            }
        case 3:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying03")!
            }
        case 4:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying04")!
            }
        case 5:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying05")!
            }
        case 6:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying06")!
            }
        case 7:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying07")!
            }
        case 8:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying08")!
            }
        case 9:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying09")!
            }
        case 10:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying10")!
            }
        case 11:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying11")!
            }
        case 12:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying12")!
            }
        case 13:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRatDying13")!
            }
        default:
            image = UIImage(named: "BrownRatDying00")
        }
        return image!
    }
    
    func backgroundMovingImage(phase:Int) -> UIImage{
        
        let background = worlds[worldNumber].quests[questNumber].background
        
        switch(phase){
            
        case 0:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground00")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground00")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground00")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods00")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard00")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard00")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard00")!
            } else if (background == "Market"){
                return UIImage(named: "Market00")!
            }
        case 1:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground01")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground01")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground01")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods01")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard01")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard01")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard01")!
            } else if (background == "Market"){
                return UIImage(named: "Market01")!
            }
        case 2:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground02")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground02")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground02")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods02")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard02")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard02")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard02")!
            } else if (background == "Market"){
                return UIImage(named: "Market02")!
            }
        case 3:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground03")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground03")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground03")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods03")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard03")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard03")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard03")!
            } else if (background == "Market"){
                return UIImage(named: "Market03")!
            }
        case 4:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground04")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground04")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground04")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods04")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard04")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard04")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard04")!
            } else if (background == "Market"){
                return UIImage(named: "Market04")!
            }
        case 5:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground05")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground05")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground05")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods05")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard05")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard05")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard05")!
            } else if (background == "Market"){
                return UIImage(named: "Market05")!
            }
        case 6:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground06")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground06")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground06")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods06")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard06")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard06")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard06")!
            } else if (background == "Market"){
                return UIImage(named: "Market06")!
            }
        case 7:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground07")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground07")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground07")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods07")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard07")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard07")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard07")!
            } else if (background == "Market"){
                return UIImage(named: "Market07")!
            }
        case 8:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground08")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground08")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground08")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods08")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard08")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard08")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard08")!
            } else if (background == "Market"){
                return UIImage(named: "Market08")!
            }
        case 9:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground09")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground00")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground00")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods09")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard09")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard09")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard09")!
            } else if (background == "Market"){
                return UIImage(named: "Market09")!
            }
        case 10:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground10")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground01")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground01")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods10")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard10")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard10")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard10")!
            } else if (background == "Market"){
                return UIImage(named: "Market10")!
            }
        case 11:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground11")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground02")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground02")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods11")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard11")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard11")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard11")!
            } else if (background == "Market"){
                return UIImage(named: "Market11")!
            }
        case 12:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground12")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground03")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground03")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods12")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard12")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard12")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard12")!
            } else if (background == "Market"){
                return UIImage(named: "Market12")!
            }
        case 13:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground13")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground04")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground04")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods13")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard13")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard13")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard13")!
            } else if (background == "Market"){
                return UIImage(named: "Market13")!
            }
        case 14:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground14")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground05")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground05")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods14")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard14")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard14")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard14")!
            } else if (background == "Market"){
                return UIImage(named: "Market14")!
            }
        case 15:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground15")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground06")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground06")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods15")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard15")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard15")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard15")!
            } else if (background == "Market"){
                return UIImage(named: "Market15")!
            }
        case 16:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground16")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground07")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground07")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods16")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard16")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard16")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard16")!
            } else if (background == "Market"){
                return UIImage(named: "Market16")!
            }
        case 17:
            if(background == "Empty House"){
                return UIImage(named: "EmptyHouseBackground17")!
            } else if (background == "Tundra Fields"){
                return UIImage(named: "TundraBackground08")!
            } else if (background == "Birch Grove"){
                return UIImage(named: "BirchGroveBackground08")!
            } else if (background == "Dry Woods"){
                return UIImage(named: "DryWoods17")!
            } else if (background == "Dry Graveyard"){
                return UIImage(named: "DryGraveyard17")!
            } else if (background == "Green Graveyard"){
                return UIImage(named: "GreenGraveyard17")!
            } else if (background == "Barren Graveyard"){
                return UIImage(named: "BarrenGraveyard17")!
            } else if (background == "Market"){
                return UIImage(named: "Market17")!
            }
        default:
            return UIImage(named: "EmptyHouseBackground00")!
            
        }
        return UIImage(named: "EmptyHouseBackground00")!
    }
    
    func enemyRightwardImage(phase: Int, enemy: String) -> UIImage {
        
        switch(phase){
            
        case 0:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat10")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeRightward00")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull00")!
            }
        case 1:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat11")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeRightward01")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull01")!
            }
        case 2:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat12")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeRightward02")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull02")!
            }
        case 3:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat13")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeRightward03")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull01")!
            }
        default:
            return UIImage(named: "BrownRat10")!
        }
        return UIImage(named: "BrownRat10")!
    }
    
    func enemyLeftwardImage(phase: Int, enemy:String) -> UIImage{
        
        switch(phase){
            
        case 0:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat10")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeLeftward00")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull00")!
            }
        case 1:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat11")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeLeftward01")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull01")!
            }
        case 2:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat12")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeLeftward02")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull02")!
            }
        case 3:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat13")!
            } else if (enemy == "Brown Doe"){
                return UIImage(named: "BrownDoeLeftward03")!
            } else if (enemy == "Graveyard Skull"){
                return UIImage(named: "GraveyardSkull01")!
            }
        default:
            return UIImage(named: "BrownRat10")!
        }
        return UIImage(named: "BrownRat10")!
    }
    
    func enemyAttackingImage(phase: Int, enemy: String) -> UIImage{
        
        switch(phase){
            
        case 0:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat00")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull00")!
            }
        case 1:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat01")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull01")!
            }
        case 2:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat02")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull02")!
            }
        case 3:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat03")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull03")!
            }
        case 4:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat04")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull04")!
            }
        case 5:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat05")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull05")!
            }
        case 6:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat06")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull06")!
            }
        case 7:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat07")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull07")!
            }
        case 8:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat08")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull08")!
            }
        case 9:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat09")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull09")!
            }
        case 10:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat10")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull10")!
            }
        case 11:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat11")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull11")!
            }
        case 12:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat12")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull12")!
            }
        case 13:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat13")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull13")!
            }
        case 14:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat14")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull00")!
            }
        case 15:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat15")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull01")!
            }
        case 16:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat16")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull02")!
            }
        case 17:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat17")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull11")!
            }
        case 18:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat18")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull12")!
            }
        case 19:
            if(enemy == "Brown Rat"){
                return UIImage(named: "BrownRat19")!
            } else if (enemy == "Graveyard Skull") {
                return UIImage(named: "GraveyardSkull13")!
            }
        default:
            return UIImage(named: "BrownRat00")!
            
        }
        
        return UIImage(named: "BrownRat00")!
    }
    
    func playerAttackingImage(phase: Int, equip: String) -> UIImage{
        
        var image: UIImage = UIImage(named: "LeftLeatherGloveStabbing02")!
        
        switch(phase){
            
        case 0:
            if (equip == "Hair"){
                image = UIImage(named: "HairMoving00")!
            }
            
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing00")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing00")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing00")!
            }
        case 1:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing01")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing01")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing01")!
            }
        case 2:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing02")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing02")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing02")!
            }
        case 3:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing03")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing03")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing03")!
            }
        case 4:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing04")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing04")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing04")!
            }
        case 5:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing05")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing05")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing05")!
            }
        case 6:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing06")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing06")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing06")!
            }
        case 7:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing07")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing07")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing07")!
            }
        case 8:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing08")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing08")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing08")!
            }
        case 9:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing09")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing09")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing09")!
            }
        case 10:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing10")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing10")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing10")!
            }
        case 11:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing11")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing11")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing11")!
            }
        case 12:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing12")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing12")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing12")!
            }
        case 13:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing13")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing13")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing13")!
            }
        case 14:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing14")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing14")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing14")!
            }
        case 15:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing15")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing15")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing15")!
            }
        case 16:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing16")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing16")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing16")!
            }
        case 17:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing17")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing17")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing17")!
            }
        case 18:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing18")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing18")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing18")!
            }
        case 19:
            if(equip == "Cloth Jerkin"){
                image = UIImage(named: "ClothJerkinStabbing19")!
            } else if (equip == "Shoddy Left Leather Glove" || equip == "Standard Left Leather Glove" || equip == "Surplus Left Leather Glove" || equip == "Specialty Left Leather Glove" || equip == "Patchwork Left Leather Glove" || equip == "Proper Left Leather Glove" || equip == "Premium Left Leather Glove" || equip == "Prized Left Leather Glove"){
                image = UIImage(named: "LeftLeatherGloveStabbing19")!
            } else if (equip == "Right Leather Glove"){
                
            } else if (equip == "Shoddy Kitchen Knife" || equip == "Standard Kitchen Knife" || equip == "Surplus Kitchen Knife" || equip == "Specialty Kitchen Knife" || equip == "Patchwork Kitchen Knife" || equip == "Proper Kitchen Knife" || equip == "Premium Kitchen Knife" || equip == "Prized Kitchen Knife"){
                image = UIImage(named: "KitchenKnifeStabbing19")!
            }
        default:
            image = UIImage(named: "LeftLeatherGloveStabbing02")!
        }
        return image
    }
    
    func playerRightwardImage(phase: Int, equip: String) -> UIImage{
        
        switch(phase){
            
        case 0:
            if(equip == "Hair"){
                return UIImage(named: "HairMoving00")!
            }
            
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward00")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward00")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward00")!
            }
        case 1:
            if(equip == "Hair"){
                return UIImage(named: "HairMoving01")!
            }
            
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward01")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward01")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward01")!
            }
        case 2:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward02")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward02")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward02")!
            }
        case 3:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward03")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward03")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward03")!
            }
        case 4:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward04")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward04")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward04")!
            }
        case 5:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward05")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward05")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward05")!
            }
        case 6:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward06")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward06")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward06")!
            }
        case 7:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward07")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward07")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward07")!
            }
        case 8:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward08")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward08")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward08")!
            }
        case 9:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward09")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward09")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward09")!
            }
        case 10:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward10")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward10")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward10")!
            }
        case 11:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward11")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward11")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward11")!
            }
        case 12:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward12")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward12")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward12")!
            }
        case 13:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward13")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward13")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward13")!
            }
        case 14:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward14")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward14")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward14")!
            }
        case 15:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward15")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward15")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward15")!
            }
        case 16:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward16")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward16")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward16")!
            }
        case 17:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward17")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward17")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward17")!
            }
        case 18:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward18")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward18")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward18")!
            }
        case 19:
            if (equip == "Cloth Sock"){
                return UIImage(named: "ClothSockRightward19")!
            } else if (equip == "Cloth Hammer Shorts"){
                return UIImage(named: "ClothHammerShortsRightward19")!
            } else if (equip == "Cloth Jerkin"){
                return UIImage(named: "ClothJerkinRightward19")!
            }
        default:
            return UIImage(named: "ClothJerkinRightward00")!
        
    }
        return UIImage(named: "ClothHammerShortsRightward01")!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Currently trying to save level if quit...
        worlds[worldNumber].character.distance = 0
        worlds[worldNumber].worldTimer?.invalidate()
        worlds[worldNumber].worldTimer = nil
        worlds[worldNumber].character.actionNumber = 0
        
        if segue.identifier == "backToMenu" {
            
            let nvc = segue.destination as! MenuViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, head back to the world menu.")
            
        } else if segue.identifier == "backToStart" {
            
            let nvc = segue.destination as! StartViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            print("Successfully sent over data, headed back to the quest list.")
            
        } else if segue.identifier == "toVictory" {
            
            let nvc = segue.destination as! VictoryViewController
            nvc.worlds = worlds
            nvc.worldNumber = worldNumber
            nvc.questNumber = questNumber
            print("Successfully sent over data, headed to the victory screen.")
            
        }
        
    }
    
}
