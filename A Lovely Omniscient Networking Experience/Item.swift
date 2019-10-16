//
//  Item.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 1/3/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import Foundation

class Item {
    
    //A pixel is a cubic centimeter.
    
    /*
     Material Weights:
     Full side is 100% of weight, darkened edge is 50% of weight.
     Raw Wood: 1g/pixel - 4 copper per kg
     Varnished Wood: 2g/pixel - 4 silver per kg
     Copper: 9g/pixel - 4 silver, 7 copper per kg
     Leather: 5g/pixel - 3 silver per kg
    */
    
    //Crit chances are the head size / 100 + head weight / 100 * min multiplier
    
    /*
     Material Damages: Based on head size.
     Wood - .5x
     Copper - 1x
     Bronze - 2x
     Iron - 3x
     Steel - 4x
     Should this be redone to match more accurate ways of damage dealing?
     Perhaps only decreases likelihood of becoming damaged, but not necessarily increased damage?
     */
    
    /*
     Weapon Stats:
     Damage is based on the head of the weapon.
     Dagger Modifiers:
     HPRange = 20% - 200%
     EPRange = 0% - 30%
     MPRange = 0% - 50%
     Sword Modifiers:
     HPRange = 40% - 150%
     EPRange = 20% - 100%
     MPRange = 0% - 50%
     Axe Modifiers:
     HPRange = 20% - 80%
     EPRange = 40% - 100%
     MPRange = 50% - 100%
     Hammer Modifiers:
     HPRange = 0% - 50%
     EPRange = 20% - 100%
     MPRange = 100% - 200%
    */
    
    /*
     Armor Stats:
     Armor is based on the type of material.
     Resistances are based on "Base" * "Material" * "Mod Boost"
     Cloth Modifiers:
     bleedResist: 100%
     physicalResist: 50%
     mentalResist: 25%
     x1 weight
     x1 value
     Fur Modifiers:
     bleedResist: 75%
     physicalResist: 75%
     mentalResist: 50%
     x3 weight
     x2 value
     Fur Modifiers:
     bleedResist: 100%
     physicalResist: 75%
     mentalResist: 50%
     x2 weight
     x3 value
     Silk Modifiers:
     bleedResist: 150%
     physicalResist: 50%
     mentalResist: 25%
     x1 weight
     x4 value
     */
    
    //Pocket sizes are based on my iphone XR. See Standard Hammer Shorts for base example. The dimensions are height * width * depth.
    //Accuracy is based on % of hittable pieces + weight of grip / 100.
    //Is that latter part realistic?
    
    //Health statistics.
    var HP: Int = 0
    var maxHP: Int = 0
    var MP: Int = 0
    var maxMP: Int = 0
    var EP: Int = 0
    var maxEP: Int = 0
    
    //Hit statistics.
    var accuracy: Int = 0
    var evasion: Int = 0
    var weight: Int = 0
    var size: Int = 0
    
    //Damage statistics.
    var minHPDMG: Int = 0
    var maxHPDMG: Int = 0
    var minEPDMG: Int = 0
    var maxEPDMG: Int = 0
    var minMPDMG: Int = 0
    var maxMPDMG: Int = 0
    var critHP: Int = 0
    var critEP: Int = 0
    var critMP: Int = 0
    var saturation: Int = 0
    var hydration: Int = 0
    
    //Resistance statistics.
    var bleedResist: Int = 0
    var physicalResist: Int = 0
    var mentalResist: Int = 0
    var fireResist: Int = 0
    var frostResist: Int = 0
    var poisonResist: Int  = 0
    var stunResist: Int = 0
    
    //Biographical data.
    var adjectiveName: String
    var fullName: String
    var itemName: String
    var name: String
    var qualityName: String
    var slot: String
    var value: Int = 0
    var count: Int = 1
    var pockets: Array<Pocket> = []
    
    /*SOON TO BE REDONE*/
    func setPockets(slot: String, item: Item) {
        
        if slot == "Legs" {
            
            //Hammer Shorts
            if(name == "Shoddy Cloth Hammer Shorts" || name == "Shoddy Fur Hammer Shorts" || name == "Shoddy Leather Hammer Shorts" || name == "Shoddy Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 13 * 8 * 3, mx: 1500)
                item.pockets.append(pocket)
            } else if (name == "Standard Cloth Hammer Shorts" || name == "Standard Fur Hammer Shorts" || name == "Standard Leather Hammer Shorts" || name == "Standard Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 15 * 8 * 3, mx: 2000)
                item.pockets.append(pocket)
            } else if (name == "Surplus Cloth Hammer Shorts" || name == "Surplus Fur Hammer Shorts" || name == "Surplus Leather Hammer Shorts" || name == "Surplus Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 17 * 8 * 3, mx: 2500)
                item.pockets.append(pocket)
            } else if (name == "Specialty Cloth Hammer Shorts" || name == "Specialty Fur Hammer Shorts" || name == "Specialty Leather Hammer Shorts" || name == "Specialty Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 19 * 8 * 3, mx: 3000)
                item.pockets.append(pocket)
            } else if (name == "Patchwork Cloth Hammer Shorts" || name == "Patchwork Fur Hammer Shorts" || name == "Patchwork Leather Hammer Shorts" || name == "Patchwork Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 13 * 9 * 3, mx: 1700)
                item.pockets.append(pocket)
            } else if (name == "Proper Cloth Hammer Shorts" || name == "Proper Fur Hammer Shorts" || name == "Proper Leather Hammer Shorts" || name == "Proper Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 15 * 9 * 3, mx: 2200)
                item.pockets.append(pocket)
            } else if (name == "Premium Cloth Hammer Shorts" || name == "Premium Fur Hammer Shorts" || name == "Premium Leather Hammer Shorts" || name == "Premium Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 17 * 9 * 3, mx: 2700)
                item.pockets.append(pocket)
            } else if (name == "Prized Cloth Hammer Shorts" || name == "Prized Fur Hammer Shorts" || name == "Prized Leather Hammer Shorts" || name == "Prized Silk Hammer Shorts"){
                let pocket: Pocket = Pocket(ms: 17 * 9 * 3, mx: 3200)
                item.pockets.append(pocket)
            }
            
        } else if slot == "Chest" {
            
            //Jerkins
            if(name == "Shoddy Cloth Jerkin" || name == "Shoddy Fur Jerkin" || name == "Shoddy Leather Jerkin" || name == "Shoddy Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 32, mx: 900)
                item.pockets.append(pocket)
            } else if (name == "Standard Cloth Jerkin" || name == "Standard Fur Jerkin" || name == "Standard Leather Jerkin" || name == "Standard Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 36, mx: 1000)
                item.pockets.append(pocket)
            } else if (name == "Surplus Cloth Jerkin" || name == "Surplus Fur Jerkin" || name == "Surplus Leather Jerkin" || name == "Surplus Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 40, mx: 1100)
                item.pockets.append(pocket)
            } else if (name == "Specialty Cloth Jerkin" || name == "Specialty Fur Jerkin" || name == "Specialty Leather Jerkin" || name == "Specialty Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 44, mx: 1200)
                item.pockets.append(pocket)
            } else if (name == "Patchwork Cloth Jerkin" || name == "Patchwork Fur Jerkin" || name == "Patchwork Leather Jerkin" || name == "Patchwork Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 33, mx: 925)
                item.pockets.append(pocket)
            } else if (name == "Proper Cloth Jerkin" || name == "Proper Fur Jerkin" || name == "Proper Leather Jerkin" || name == "Proper Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 37, mx: 1025)
                item.pockets.append(pocket)
            } else if (name == "Premium Cloth Jerkin" || name == "Premium Fur Jerkin" || name == "Premium Leather Jerkin" || name == "Premium Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 41, mx: 1125)
                item.pockets.append(pocket)
            } else if (name == "Prized Cloth Jerkin" || name == "Prized Fur Jerkin" || name == "Prized Leather Jerkin" || name == "Prized Silk Jerkin"){
                let pocket: Pocket = Pocket(ms: 45, mx: 1225)
                item.pockets.append(pocket)
            }
            
        }
     
    }
    
    func use() {
        
        if (name == "Shoddy Slice of Parmesan Cheese") {
            
        } else if (name == "Shoddy Slice of Cheddar Cheese") {
            
        } else if (name == "Shoddy Slice of Bleu Cheese") {
            
        } else if (name == "Shoddy Slice of Parmesan Cheese") {
            saturation = 431;
        } else if (name == "Shoddy Slice of Goat Cheese") {
            
        } else if (name == "Shoddy Slice of Feta Cheese") {
            
        } else if (name == "Shoddy Slice of Brie Cheese") {
            
        } else if (name == "Shoddy Egg Yolk") {
            saturation = 45;
        } else if (name == "Shoddy Egg Whites") {
            saturation = 18;
        } else if (name == "Shoddy White Egg") {
            saturation = 63;
        } else if (name == "Shoddy Brown Egg") {
            saturation = 63;
        } else if (name == "Standard Egg Yolk") {
            saturation = 50;
        } else if (name == "Standard Egg Whites") {
            saturation = 20;
        } else if (name == "Standard White Egg") {
            saturation = 70;
        } else if (name == "Standard Brown Egg") {
            saturation = 70;
        } else if (name == "Surplus Egg Yolk") {
            saturation = 55;
        } else if (name == "Surplus Egg Whites") {
            saturation = 22;
        } else if (name == "Surplus White Egg") {
            saturation = 77;
        } else if (name == "Surplus Brown Egg") {
            saturation = 77;
        } else if (name == "Specialty Egg Yolk") {
            saturation = 60;
        } else if (name == "Specialty Egg Whites") {
            saturation = 24;
        } else if (name == "Specialty White Egg") {
            saturation = 84;
        } else if (name == "Specialty Brown Egg") {
            saturation = 84;
        } else if (name == "Shoddy Boiled Egg") {
            saturation = 67;
        } else if (name == "Patchwork Boiled Egg") {
            saturation = 71;
        } else if (name == "Standard Boiled Egg") {
            saturation = 74;
        } else if (name == "Proper Boiled Egg") {
            saturation = 78;
        } else if (name == "Surplus Boiled Egg") {
            saturation = 81;
        } else if (name == "Premium Boiled Egg") {
            saturation = 85;
        } else if (name == "Specialty Boiled Egg") {
            saturation = 88;
        } else if (name == "Prized Boiled Egg") {
            saturation = 92;
        } else if (name == "Shoddy Poached Egg") {
            saturation = 63;
        } else if (name == "Patchwork Poached Egg") {
            saturation = 66;
        } else if (name == "Standard Poached Egg") {
            saturation = 70;
        } else if (name == "Proper Poached Egg") {
            saturation = 73;
        } else if (name == "Surplus Poached Egg") {
            saturation = 77;
        } else if (name == "Premium Poached Egg") {
            saturation = 80;
        } else if (name == "Specialty Poached Egg") {
            saturation = 84;
        } else if (name == "Prized Poached Egg") {
            saturation = 87;
        }
        
    }
    
    func setStats() {

        if (name == "Shoddy Copper Pugio"){
            
            minHPDMG = 100
            maxHPDMG = 250
            minEPDMG = 0
            maxEPDMG = 50
            minMPDMG = 50
            maxMPDMG = 300
            critHP = 9
            critEP = 1
            critMP = 4
            
            accuracy = 40
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 20 /*Varnished Wood*/ + 6 /*Raw Wood*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (20 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 20 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/
            
        } else if (name == "Patchwork Copper Pugio"){
            
            minHPDMG = 115
            maxHPDMG = 250
            minEPDMG = 3
            maxEPDMG = 50
            minMPDMG = 65
            maxMPDMG = 300
            critHP = 9
            critEP = 1
            critMP = 4
            
            accuracy = 46
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 26 /*Varnished Wood*/ + 6 /*Raw Wood*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (26 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 26 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/
            
        } else if (name == "Standard Copper Pugio"){
            
            minHPDMG = 125
            maxHPDMG = 250
            minEPDMG = 5
            maxEPDMG = 50
            minMPDMG = 75
            maxMPDMG = 300
            critHP = 10
            critEP = 2
            critMP = 5
            
            accuracy = 50
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 38 /*Varnished Wood*/ + 6 /*Raw Wood*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (38 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 38 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/
            
        } else if (name == "Proper Copper Pugio"){
            
            minHPDMG = 140
            maxHPDMG = 250
            minEPDMG = 8
            maxEPDMG = 50
            minMPDMG = 90
            maxMPDMG = 300
            critHP = 10
            critEP = 2
            critMP = 5
            
            accuracy = 56
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 42 /*Varnished Wood*/ + 6 /*Raw Wood*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (42 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 42 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/
            
        } else if (name == "Surplus Copper Pugio"){
            
            minHPDMG = 150
            maxHPDMG = 250
            minEPDMG = 10
            maxEPDMG = 50
            minMPDMG = 100
            maxMPDMG = 300
            critHP = 11
            critEP = 3
            critMP = 6
            
            accuracy = 60
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 40 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 20 /*Leather*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (40 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/ + (20 * 30 / 1000) /*Leather*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 40 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 20 / 5 /*Leather*/
            
        } else if (name == "Premium Copper Pugio"){
            
            minHPDMG = 165
            maxHPDMG = 250
            minEPDMG = 13
            maxEPDMG = 50
            minMPDMG = 115
            maxMPDMG = 300
            critHP = 11
            critEP = 3
            critMP = 6
            
            accuracy = 66
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 50 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 20 /*Leather*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (50 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/ + (20 * 30 / 1000) /*Leather*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 50 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 20 / 5 /*Leather*/
            
        } else if (name == "Specialty Copper Pugio"){
            
            minHPDMG = 175
            maxHPDMG = 250
            minEPDMG = 15
            maxEPDMG = 50
            minMPDMG = 125
            maxMPDMG = 300
            critHP = 12
            critEP = 4
            critMP = 7
            
            accuracy = 70
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 42 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 60 /*Leather*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (42 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/ + (60 * 30 / 1000) /*Leather*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 42 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 60 / 5 /*Leather*/
            
        } else if (name == "Prized Copper Pugio"){
            
            minHPDMG = 190
            maxHPDMG = 250
            minEPDMG = 18
            maxEPDMG = 50
            minMPDMG = 140
            maxMPDMG = 300
            critHP = 12
            critEP = 4
            critMP = 7
            
            accuracy = 76
            
            weight = 522 /*Copper Head*/ + 117 /*Copper Edge*/ + 56 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 60 /*Leather*/
            value = (522 * 47 / 1000) /*Copper Head*/ + (117 * 47 / 1000) /*Copper Edge*/ + (56 * 40 / 1000) /*Varnished Wood*/ + (6 * 4 / 1000) /*Raw Wood*/ + (60 * 30 / 1000) /*Leather*/
            size = 522 / 9 /*Copper Head*/ + 117 / 9 /*Copper Edge*/ + 56 / 2 /*Varnished Wood*/ + 6 /*Raw Wood*/ + 60 / 5 /*Leather*/
            
        } else if (name == "Shoddy Kitchen Knife"){
            //Head Value: 117
            minHPDMG = 23 //.2x
            maxHPDMG = 234 //2x
            minEPDMG = 0 //0x
            maxEPDMG = 35 //.3x
            minMPDMG = 0 //0x
            maxMPDMG = 58 //.5x
            critHP = (117/100 + (666 + 193)/100)
            critHP = Int(Double(critHP) * 0.2)
            
            accuracy = 70
            
            weight = 666 + 193 /*Copper Head*/ + 41 + 17 /*Raw Wood*/
            value = ((666 + 193) * 47 / 1000) /*Copper Head*/ + ((41 + 17) * 4 / 1000) /*Raw Wood*/
            size = (666 + 193) / 9 /*Copper Head*/ + 41 + 17 /*Raw Wood*/
            
        } else if (name == "Standard Kitchen Knife"){
            //Head Value: 119
            minHPDMG = 23 //.2x
            maxHPDMG = 238 //2x
            minEPDMG = 0 //0x
            maxEPDMG = 35 //.3x
            minMPDMG = 0 //0x
            maxMPDMG = 59 //.5x
            critHP = (119/100 + (666 + 202)/100)
            critHP = Int(Double(critHP) * 0.2)
            
            accuracy = 70
            
            weight = 666 + 202 /*Copper Head*/ + 45 + 18 /*Raw Wood*/
            value = ((666 + 202) * 47 / 1000) /*Copper Head*/+ ((45 + 18) * 4 / 1000) /*Raw Wood*/
            size = (666 + 202) / 9 /*Copper Head*/ + 45 + 18 /*Raw Wood*/
            
        } else if (name == "Surplus Kitchen Knife"){
            //Head Value: 119
            minHPDMG = 23 //0.2x
            maxHPDMG = 238 //2.0x
            minEPDMG = 0 //0.0x
            maxEPDMG = 35 //0.3x
            minMPDMG = 0 //0.0x
            maxMPDMG = 59 //0.5x
            critHP = (119/100 + (666 + 202)/100)
            critHP = Int(Double(critHP) * 0.2)
            
            accuracy = 70
            
            weight = 666 + 202 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + 60 + 20 /*Leather*/
            value = ((666 + 202) * 47 / 1000) /*Copper Head*/+ ((45 + 18) * 4 / 1000) /*Raw Wood*/ + ((60 + 20) * 30 / 1000) /*Leather*/
            size = (666 + 202) / 9 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + (60 + 20) / 5 /*Leather*/
            
        } else if (name == "Specialty Kitchen Knife"){
            //Head Value: 119
            minHPDMG = 23 //0.2x
            maxHPDMG = 238 //2.0x
            minEPDMG = 0 //0.0x
            maxEPDMG = 35 //0.3x
            minMPDMG = 0 //0.0x
            maxMPDMG = 59 //0.5x
            critHP = (119/100 + (666 + 202)/100)
            critHP = Int(Double(critHP) * 0.2)
            
            accuracy = 71
            
            weight = 666 + 202 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + 105 + 35 /*Leather*/
            value = ((666 + 202) * 47 / 1000) /*Copper Head*/+ ((45 + 18) * 4 / 1000) /*Raw Wood*/ + ((105 + 35) * 30 / 1000) /*Leather*/
            size = (666 + 202) / 9 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + (105 + 35) / 5 /*Leather*/
            
        } else if (name == "Patchwork Kitchen Knife"){
            //Head Value: 118
            minHPDMG = 23 //0.2x
            maxHPDMG = 236 //2.0x
            minEPDMG = 0 //0.0x
            maxEPDMG = 35 //0.3x
            minMPDMG = 0 //0.0x
            maxMPDMG = 59 //0.5x
            critHP = (119/100 + (666 + 198)/100)
            critHP = Int(Double(critHP) * 0.2)
            
            accuracy = 70
            
            weight = 666 + 198 /*Copper Head*/ + 46 + 21 /*Raw Wood*/
            value = ((666 + 198) * 47 / 1000) /*Copper Head*/ + ((46 + 21) * 4 / 1000) /*Raw Wood*/
            size = (666 + 198) / 9 /*Copper Head*/ + 46 + 21 /*Raw Wood*/
            
        } else if (name == "Proper Kitchen Knife"){
            //Head Value: 119
            minHPDMG = 23 //0.2x
            maxHPDMG = 238 //2.0x
            minEPDMG = 0 //0.0x
            maxEPDMG = 35 //0.3x
            minMPDMG = 0 //0.0x
            maxMPDMG = 59 //0.5x
            critHP = (119/100 + (666 + 202)/100)
            critHP = Int(Double(critHP) * 0.2)
            
            accuracy = 70
            
            weight = 666 + 202 /*Copper Head*/ + 45 + 22 /*Raw Wood*/
            value = ((666 + 202) * 47 / 1000) /*Copper Head*/+ ((45 + 22) * 4 / 1000) /*Raw Wood*/
            size = (666 + 202) / 9 /*Copper Head*/ + 45 + 22 /*Raw Wood*/
            
        } else if (name == "Premium Kitchen Knife"){
            //Head Value: 119
            minHPDMG = 23 //0.2x
            maxHPDMG = 238 //2.0x
            minEPDMG = 0 //0.0x
            maxEPDMG = 35 //0.3x
            minMPDMG = 0 //0.0x
            maxMPDMG = 59 //0.5x
            critHP = (119/100 + (666 + 202)/100)
            critHP = Int(Double(critHP) * 0.2)

            
            accuracy = 70
            
            weight = 666 + 202 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + 60 + 20 /*Leather*/
            value = ((666 + 202) * 47 / 1000) /*Copper Head*/+ ((45 + 18) * 4 / 1000) /*Raw Wood*/ + ((60 + 20) * 30 / 1000) /*Leather*/
            size = (666 + 202) / 9 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + (60 + 20) / 5 /*Leather*/
            
        } else if (name == "Prized Kitchen Knife"){
            //Head Value: 119
            minHPDMG = 23 //0.2x
            maxHPDMG = 238 //2.0x
            minEPDMG = 0 //0.0x
            maxEPDMG = 35 //0.3x
            minMPDMG = 0 //0.0x
            maxMPDMG = 59 //0.5x
            critHP = (119/100 + (666 + 202)/100)
            critHP = Int(Double(critHP) * 0.2)
            
            accuracy = 71
            
            weight = 666 + 202 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + 105 + 35 /*Leather*/
            value = ((666 + 202) * 47 / 1000) /*Copper Head*/+ ((45 + 18) * 4 / 1000) /*Raw Wood*/ + ((105 + 35) * 30 / 1000) /*Leather*/
            size = (666 + 202) / 9 /*Copper Head*/ + 45 + 18 /*Raw Wood*/ + (105 + 35) / 5 /*Leather*/
            
        } else if (name == "Rat Claws"){
            //Head Value: 25
            minHPDMG = 10 //0.4x
            maxHPDMG = Int(37.5) //1.5x
            minEPDMG = 5 //0.2x
            maxEPDMG = 25 //1.0x
            minMPDMG = 0 //0.0x
            maxMPDMG = 12 //0.5x
            
            accuracy = 75
            
        } /*Cloth Hammer Shorts*/ else if (name == "Shoddy Cloth Hammer Shorts") {
            
            bleedResist = Int(5 * 1)
            physicalResist = Int(5 * 0.5)
            mentalResist = Int(5 * 0.25)
            
            weight = 250 * 1
            value = 14 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Standard Cloth Hammer Shorts") {
            
            bleedResist = Int(6 * 1)
            physicalResist = Int(6 * 0.5)
            mentalResist = Int(6 * 0.25)
            
            weight = 275 * 1
            value = 15 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Surplus Cloth Hammer Shorts") {
            
            bleedResist = Int(7 * 1)
            physicalResist = Int(7 * 0.5)
            mentalResist = Int(7 * 0.25)
            
            weight = 300 * 1
            value = 16 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Specialty Cloth Hammer Shorts") {
            
            bleedResist = Int(8 * 1)
            physicalResist = Int(8 * 0.5)
            mentalResist = Int(8 * 0.25)
            
            weight = 325 * 1
            value = 17 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Patchwork Cloth Hammer Shorts") {
            
            bleedResist = Int(5 * 1 * 1.5)
            physicalResist = Int(5 * 0.5 * 1.25)
            mentalResist = Int(5 * 0.25 * 1.1)
            
            weight = 275 * 1
            value = 15 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Proper Cloth Hammer Shorts") {
            
            bleedResist = Int(6 * 1 * 1.5)
            physicalResist = Int(6 * 0.5 * 1.25)
            mentalResist = Int(6 * 0.25 * 1.1)
            
            weight = 300 * 1
            value = 16 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Premium Cloth Hammer Shorts") {
            
            bleedResist = Int(7 * 1 * 1.5)
            physicalResist = Int(7 * 0.5 * 1.25)
            mentalResist = Int(7 * 0.25 * 1.1)
            
            weight = 325 * 1
            value = 17 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Prized Cloth Hammer Shorts") {
            
            bleedResist = Int(8 * 1 * 1.5)
            physicalResist = Int(8 * 0.5 * 1.25)
            mentalResist = Int(8 * 0.25 * 1.1)
            
            weight = 350 * 1
            value = 18 * 5 * 1
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } /*Fur Hammer Shorts*/ else if (name == "Shoddy Fur Hammer Shorts") {
            
            bleedResist = Int(5 * 0.75)
            physicalResist = Int(5 * 0.75)
            mentalResist = Int(5 * 0.50)
            
            weight = 250 * 3
            value = 14 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Standard Fur Hammer Shorts") {
            
            bleedResist = Int(6 * 0.75)
            physicalResist = Int(6 * 0.75)
            mentalResist = Int(6 * 0.5)
            
            weight = 275 * 3
            value = 15 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Surplus Fur Hammer Shorts") {
            
            bleedResist = Int(7 * 0.75)
            physicalResist = Int(7 * 0.75)
            mentalResist = Int(7 * 0.5)
            
            weight = 300 * 3
            value = 16 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Specialty Fur Hammer Shorts") {
            
            bleedResist = Int(8 * 0.75)
            physicalResist = Int(8 * 0.75)
            mentalResist = Int(8 * 0.5)
            
            weight = 325 * 3
            value = 17 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Patchwork Fur Hammer Shorts") {
            
            bleedResist = Int(5 * 0.75 * 1.3)
            physicalResist = Int(5 * 0.75 * 1.3)
            mentalResist = Int(5 * 0.5 * 1.2)
            
            weight = 275 * 3
            value = 15 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Proper Fur Hammer Shorts") {
            
            bleedResist = Int(6 * 0.75 * 1.3)
            physicalResist = Int(6 * 0.75 * 1.3)
            mentalResist = Int(6 * 0.5 * 1.2)
            
            weight = 300 * 3
            value = 16 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Premium Fur Hammer Shorts") {
            
            bleedResist = Int(7 * 0.75 * 1.3)
            physicalResist = Int(7 * 0.75 * 1.3)
            mentalResist = Int(7 * 0.5 * 1.2)
            
            weight = 325 * 3
            value = 17 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Prized Fur Hammer Shorts") {
            
            bleedResist = Int(8 * 0.75 * 1.3)
            physicalResist = Int(8 * 0.75 * 1.3)
            mentalResist = Int(8 * 0.5 * 1.2)
            
            weight = 350 * 3
            value = 18 * 5 * 2
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } /*Leather Hammer Shorts*/ else if (name == "Shoddy Leather Hammer Shorts") {
            
            bleedResist = Int(5 * 1)
            physicalResist = Int(5 * 0.75)
            mentalResist = Int(5 * 0.50)
            
            weight = 250 * 2
            value = 14 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Standard Leather Hammer Shorts") {
            
            bleedResist = Int(6 * 1)
            physicalResist = Int(6 * 0.75)
            mentalResist = Int(6 * 0.5)
            
            weight = 275 * 2
            value = 15 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Surplus Leather Hammer Shorts") {
            
            bleedResist = Int(7 * 1)
            physicalResist = Int(7 * 0.75)
            mentalResist = Int(7 * 0.5)
            
            weight = 300 * 2
            value = 16 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Specialty Leather Hammer Shorts") {
            
            bleedResist = Int(8 * 1)
            physicalResist = Int(8 * 0.75)
            mentalResist = Int(8 * 0.5)
            
            weight = 325 * 2
            value = 17 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Patchwork Leather Hammer Shorts") {
            
            bleedResist = Int(5 * 1 * 1.5)
            physicalResist = Int(5 * 0.75 * 1.3)
            mentalResist = Int(5 * 0.5 * 1.2)
            
            weight = 275 * 2
            value = 15 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Proper Leather Hammer Shorts") {
            
            bleedResist = Int(6 * 1 * 1.5)
            physicalResist = Int(6 * 0.75 * 1.3)
            mentalResist = Int(6 * 0.5 * 1.2)
            
            weight = 300 * 2
            value = 16 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Premium Leather Hammer Shorts") {
            
            bleedResist = Int(7 * 1 * 1.5)
            physicalResist = Int(7 * 0.75 * 1.3)
            mentalResist = Int(7 * 0.5 * 1.2)
            
            weight = 325 * 2
            value = 17 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Prized Leather Hammer Shorts") {
            
            bleedResist = Int(8 * 1 * 1.5)
            physicalResist = Int(8 * 0.75 * 1.3)
            mentalResist = Int(8 * 0.5 * 1.2)
            
            weight = 350 * 2
            value = 18 * 5 * 3
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } /*Silk Hammer Shorts*/ else if (name == "Shoddy Silk Hammer Shorts") {
            
            bleedResist = Int(5 * 1.5)
            physicalResist = Int(5 * 0.5)
            mentalResist = Int(5 * 0.25)
            
            weight = 250 * 1
            value = 14 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Standard Silk Hammer Shorts") {
            
            bleedResist = Int(6 * 1.5)
            physicalResist = Int(6 * 0.5)
            mentalResist = Int(6 * 0.25)
            
            weight = 275 * 1
            value = 15 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Surplus Silk Hammer Shorts") {
            
            bleedResist = Int(7 * 1.5)
            physicalResist = Int(7 * 0.5)
            mentalResist = Int(7 * 0.25)
            
            weight = 300 * 1
            value = 16 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Specialty Silk Hammer Shorts") {
            
            bleedResist = Int(8 * 1.5)
            physicalResist = Int(8 * 0.5)
            mentalResist = Int(8 * 0.25)
            
            weight = 325 * 1
            value = 17 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Patchwork Silk Hammer Shorts") {
            
            bleedResist = Int(5 * 1.5 * 1.75)
            physicalResist = Int(5 * 0.5 * 1.25)
            mentalResist = Int(5 * 0.25 * 1.1)
            
            weight = 275 * 1
            value = 15 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Proper Silk Hammer Shorts") {
            
            bleedResist = Int(6 * 1.5 * 1.75)
            physicalResist = Int(6 * 0.5 * 1.25)
            mentalResist = Int(6 * 0.25 * 1.1)
            
            weight = 300 * 1
            value = 16 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Premium Silk Hammer Shorts") {
            
            bleedResist = Int(7 * 1.5 * 1.75)
            physicalResist = Int(7 * 0.5 * 1.25)
            mentalResist = Int(7 * 0.25 * 1.1)
            
            weight = 325 * 1
            value = 17 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        } else if (name == "Prized Silk Hammer Shorts") {
            
            bleedResist = Int(8 * 1.5 * 1.75)
            physicalResist = Int(8 * 0.5 * 1.25)
            mentalResist = Int(8 * 0.25 * 1.1)
            
            weight = 350 * 1
            value = 18 * 5 * 4
            size = 5 * 12
            
            setPockets(slot: "Legs", item: self)
            
        }
        
    }
    
    init(i: String, q: String, s: String){
        
        itemName = i
        qualityName = q
        name = q + " " + i
        slot = s
        adjectiveName = ""
        fullName = adjectiveName + " " + name
        
    }
    
    init(i: String, q: String, s: String, a: String){
        
        itemName = i
        qualityName = q
        name = q + " " + i
        slot = s
        adjectiveName = a
        fullName = adjectiveName + " " + name
        
    }
    
    init(n: String, s: String) {
        itemName = ""
        qualityName = ""
        name = n
        slot = s
        adjectiveName = ""
        fullName = n
    }
    
}
