//
//  Mineral.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 6/27/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//
// Quotes and informaton about vitamins and minerals are from https://www.health.harvard.edu/staying-healthy/listing_of_vitamins
//

import Foundation

class Mineral {
    
    var name: String
    var amount: Int // In micrograms.
    var minimum: Int
    var maximum: Int
    var debuff: Debuff
    var dispersionRate: Int
    
    init (n: String) {
        
        name = n
        
        if (name == "Vitamin A") {
            
            amount = 1800
            minimum = 900
            maximum = 3000
            dispersionRate = 900
            
            //If too little: vision, skin health, bone growth limited, immune system impaired.
            //Benefits: prevents cataracts, antioxidant.
            //If too much: death.
            
        } else if (name == "Vitamin B1") {
            
            //AKA Thiamin
            
            amount = 9600
            minimum = 4800
            maximum = LONG_MAX
            dispersionRate = 1200
            
            //If too little: can't convert food to energy, nerves can't function
            //Needed for: healthy skin, hair, muscles, brain
            //If too much: ???
            
        } else if (name == "Vitamin B2") {
            
            //AKA Riboflavin
            
            amount = 10400
            minimum = 5200
            maximum = LONG_MAX
            dispersionRate = 1300
            
            //If too little: can't convert food to energy
            //Needed for: healthy skin, hair, blood, brain
            //If too much: ???
            
        } else if (name == "Vitamin B3") {
            
            //AKA Niacin
            
            amount = 24000
            minimum = 16000
            maximum = 35000
            dispersionRate = 16000
            
            //If too little: can't convert food to energy
            //Needed for: healthy skin, hair, blood, nervous system
            //If too much: ???
            
        } else if (name == "Vitamin B5") {
            
            //AKA Pantothenic Acid
            
            amount = 40000
            minimum = 20000
            maximum = LONG_MAX
            dispersionRate = 5000
            
            //If too little: can't convert food to energy, burning feet and other neurologic symptoms
            //Needed for: fats, neurotransmittera, steroid hormones, hemoglobin
            //If too much: ???
            
        } else if (name == "Vitamin B6") {
            
            //AKA Pyridoxine
            
            amount = 10400
            minimum = 5200
            maximum = 100000
            dispersionRate = 1300
            
            //If too little: too high homocystine levels, can't convert typtopan to niacin and serotnin, irregular sleep, irregular appetite, irregular mood.
            //Needed for: red blood cells, proper cognition, proper immune function, reduces risk of heart disease
            //If too much: ???
            
        } else if (name == "Vitamin B12") {
        
            //AKA Cobalamin
            
            amount = 16
            minimum = 8
            maximum = LONG_MAX
            dispersionRate = 2
            
            //If too little: memory loss, dementia, numbness in arms and legs
            //Needed for: lowering risk of heart disease, making new cells, breaking down fatty acids, protects nerve cells & encourages their growth, helps make red blood cells and DNA
            //If too much: ???
            
        } else if (name == "Biotin") {
            
            amount = 240
            minimum = 120
            maximum = LONG_MAX
            dispersionRate = 30
            
            //If too little: can't convert food into energy, can't synthesize glucose
            //Needed for: healthy bones & hair, makes and breaks down fatty acids
            //If too much: ???
            
        } else if (name == "Vitamin C") {
            
            //AKA Ascorbic Acid
            
            amount = 180000
            minimum = 90000
            maximum = 2000000
            dispersionRate = 90000
            
            //If too little: ???
            //Info: "Foods rich in vitamin C may lower the risk for some cancers, including those of the mouth, esophagus, stomach, and breast. Long-term use of supplemental vitamin C may protect against cataracts. Helps make collagen, a connective tissue that knits together wounds and supports blood vessel walls. Helps make the neurotransmitters serotonin and norepinephrine Acts as an antioxidant, neutralizing unstable molecules that can damage cells. Bolsters the immune system"
            //If too much: ???
            //Smokers take in an extra 35000 mcg daily.
            
        } else if (name == "Choline") {
            
            amount = 1100000
            minimum = 550000
            maximum = 2000000
            dispersionRate = 550000
            
            //If too little: ???
            //Info: "Helps make and release the neurotransmitter acetylcholine, which aids in many nerve and brain activities. Plays a role in metabolizing and transporting fats."
            //If too much: ???
            
        } else if (name == "Vitamin D") {
            
            //AKA Calciferol
            
            amount = 30
            minimum = 15
            maximum = 50
            dispersionRate = 15
            
            //If too little, bone weakness, bone pain, muscle weakness, etc.
            //Info: "Helps maintain normal blood levels of calcium and phosphorus, which strengthen bones. Helps form teeth and bones. Supplements can reduce the number of non-spinal fractures." ; "While the body uses sunlight to make vitamin D, it cannot make enough if you live in northern climates or don't spend much time in the sun."
            //If too much, nausea, weakness, vomiting, etc.
            
        } else if (name == "Vitamin E") {
            
            //AKA Alpha-Tocopherol
            
            amount = 120
            minimum = 60
            maximum = 1000
            dispersionRate = 15
            
            //If too little: vision problems, muscle weakness, etc.
            //Info: "Acts as an antioxidant, neutralizing unstable molecules that can damage cells. Protects vitamin A and certain lipids from damage. Diets rich in vitamin E may help prevent Alzheimer's disease." ; "Vitamin E does not prevent wrinkles or slow other aging processes."
            //If too much, increases bleeding risk internally.
            
        } else if (name == "Vitamin B9") {
            
            //AKA Folic Acid
            
            amount = 600
            minimum = 400
            maximum = 1000
            dispersionRate = 400
            
            //If too little: ??
            //Info: "Vital for new cell creation. Helps prevent brain and spine birth defects when taken early in pregnancy; should be taken regularly by all women of child-bearing age since women may not know they are pregnant in the first weeks of pregnancy. Can lower levels of homocysteine and may reduce heart disease risk May reduce risk for colon cancer. Offsets breast cancer risk among women who consume alcohol." ; "Occasionally, folic acid masks a B12 deficiency, which can lead to severe neurological complications. That's not a reason to avoid folic acid; just be sure to get enough B12."
            //If too much: ??
            
        } else if (name == "Vitamin K") {
            
            //AKA Menadione
            
            amount = 960
            minimum = 480
            maximum = LONG_MAX
            dispersionRate = 120
            
            //If too little: ??
            //Info: "Activates proteins and calcium essential to blood clotting. May help prevent hip fractures." ; "Intestinal bacteria make a form of vitamin K that accounts for half your requirements. If you take an anticoagulant, keep your vitamin K intake consistent."
            //If too much: ??
            
        } else if (name == "Calcium") {
            
            amount = 1500000
            minimum = 1000000
            maximum = 2500000
            dispersionRate = 1000000
        
            //If too little: bone weakness, ???
            //Info: "Builds and protects bones and teeth. Helps with muscle contractions and relaxation, blood clotting, and nerve impulse transmission. Plays a role in hormone secretion and enzyme activation. Helps maintain healthy blood pressure." ; "Cheese, milk, tofu, sardines, salmon, fortified juices, leafy green vegetables, such as broccoli and kale (but not spinach or Swiss chard, which have binders that lessen absorption). Adults absorb roughly 30% of calcium ingested, but this can vary depending on the source. Diets very high in calcium may increase the risk of prostate cancer."
            //If too much: high blood pressure?, ???
            
        } else if (name == "Chloride") {
            
            amount = 16000000
            minimum = 8000000
            maximum = LONG_MAX
            dispersionRate = 2000000
            
            //If too little: ??
            //Info: "Balances fluids in the body. A component of stomach acid, essential to digestion."
            //Updates may occur; "New recommendations (DRIs) for chloride are under development by the Institute of Medicine."
            //If too much: ??
            
        } else if (name == "Chromium") {
            
            amount = 350
            minimum = 175
            maximum = LONG_MAX
            dispersionRate = 35
            
            //If too little: ??
            //Info: "Enhances the activity of insulin, helps maintain normal blood glucose levels, and is needed to free energy from glucose." ; "Unrefined foods such as brewer's yeast, nuts, and cheeses are the best sources of chromium, but brewer's yeast can sometimes cause bloating and nausea, so you may choose to get chromium from other food sources."
            //If too much: ??
            
        } else if (name == "Copper") {
            
            amount = 3600
            minimum = 1800
            maximum = 10000
            dispersionRate = 900
            
            //If too little: ??
            //Info: "Plays an important role in iron metabolism and immune system. Helps make red blood cells." ; "More than half of the copper in foods is absorbed."
            //If too much: ??
            
        } else if (name == "Fluoride") {
            
            amount = 8000
            minimum = 4000
            maximum = 10000
            dispersionRate = 4000
            
            //If too little: ??
            //Info: "Encourages strong bone formation. Keeps dental cavities from starting or worsening." ; "Harmful to children in excessive amounts."
            //If too much: ??
            
        } else if (name == "Iodine") {
            
            amount = 600
            minimum = 300
            maximum = 1100
            dispersionRate = 150
            
            //If too little: ??
            //Info: "Part of thyroid hormone, which helps set body temperature and influences nerve and muscle function, reproduction, and growth. Prevents goiter and a congenital thyroid disorder." ; "To prevent iodine deficiencies, some countries add iodine to salt, bread, or drinking water."
            //If too much: ??
            
        } else if (name == "Iron") {
            
            amount = 16000
            minimum = 8000
            maximum = 45000
            dispersionRate = 8000
            
            //If too little: ??
            //Info: "Helps hemoglobin in red blood cells and myoglobin in muscle cells ferry oxygen throughout the body. Needed for chemical reactions in the body and for making amino acids, collagen, neurotransmitters, and hormones." ; "Many women of childbearing age don't get enough iron. Women who do not menstruate probably need the same amount of iron as men. Because iron is harder to absorb from plants, experts suggest vegetarians get twice the recommended amount (assuming the source is food)."
            //If too much: ??
            
        } else if (name == "Magnesium") {
            
            amount = 84000
            minimum = 42000
            maximum = LONG_MAX
            dispersionRate = 42000
            
            //If too little: ??
            //Info: "Needed for many chemical reactions in the body Works with calcium in muscle contraction, blood clotting, and regulation of blood pressure. Helps build bones and teeth." ; "The majority of magnesium in the body is found in bones. If your blood levels are low, your body may tap into these reserves to correct the problem."
            //If too much: ??
            
        } else if (name == "Maganese") {
            
            amount = 4600
            minimum = 2300
            maximum = 11000
            dispersionRate = 2300
            
            //If too little: ??
            //Info: "Helps form bones. Helps metabolize amino acids, cholesterol, and carbohydrates." ; "If you take supplements or have manganese in your drinking water, be careful not to exceed the upper limit. Those with liver damage or whose diets supply abundant manganese should be especially vigilant."
            //If too much: ??
            
        } else if (name == "Molybdenum") {
            
            amount = 360
            minimum = 180
            maximum = 2000
            dispersionRate = 45
            
            //If too little: ??
            //Info: "Part of several enzymes, one of which helps ward off a form of severe neurological damage in infants that can lead to early death." ; "Molybdenum deficiencies are rare."
            //If too much: ??
            
        } else if (name == "Phosphorus") {
            
            amount = 1400000
            minimum = 700000
            maximum = 4000000
            dispersionRate = 700000
            
            //If too little: ??
            //Info: "Helps build and protect bones and teeth. Part of DNA and RNA. Helps convert food into energy. Part of phospholipids, which carry lipids in blood and help shuttle nutrients into and out of cells." ; "Certain drugs bind with phosphorus, making it unavailable and causing bone loss, weakness, and pain."
            //If too much: ??
            
        } else if (name == "Potassium") {
            
            amount = 9400000
            minimum = 4700000
            maximum = LONG_MAX
            dispersionRate = 4700000
            
            //If too little: ??
            //Info: "Balances fluids in the body. Helps maintain steady heartbeat and send nerve impulses. Needed for muscle contractions. A diet rich in potassium seems to lower blood pressure. Getting enough potassium from your diet may benefit bones."
            //If too much: ??
            
        } else if (name == "Selenium") {
            
            amount = 110
            minimum = 55
            maximum = 400
            dispersionRate = 55
            
            //If too little: ??
            //Info: "Acts as an antioxidant, neutralizing unstable molecules that can damage cells. Helps regulate thyroid hormone activity."
            //If too much: ??
            
        } else if (name == "Sodium") {
            
            amount = 4600000
            minimum = 2300000
            maximum = 6900000
            dispersionRate = 2300000
            
            //If too little: ??
            //Info: "Balances fluids in the body. Helps send nerve impulses. Needed for muscle contractions. Impacts blood pressure; even modest reductions in salt consumption can lower blood pressure."
            //If too much: ??
            
        } else if (name == "Sulfur") {
            
            //Do more research on this one!
            
            amount = 0
            minimum = 0
            maximum = 0
            dispersionRate = 0
            
            //If too little: ??
            //Info: "Helps form bridges that shape and stabilize some protein structures. Needed for healthy hair, skin, and nails." ; "Sulfur is a component of thiamin and certain amino acids. There is no recommended amount for sulfur. Deficiencies occur only with a severe lack of protein."
            //If too much: ??
            
        } else if (name == "Zinc") {
            
            amount = 22000
            minimum = 11000
            maximum = 40000
            dispersionRate = 11000
            
            //If too little: ??
            //Info: "Helps form many enzymes and proteins and create new cells. Frees vitamin A from storage in the liver. Needed for immune system, taste, smell, and wound healing. When taken with certain antioxidants, zinc may delay the progression of age-related macular degeneration." ; "Because vegetarians absorb less zinc, experts suggest that they get twice the recommended requirement of zinc from plant foods."
            //If too much: ??
            
        } else {
            //Default Statement, should NEVER occur.
            amount = 0
            minimum = -1
            maximum = 1
            dispersionRate = 0
            
        }
        debuff = Debuff(n: name, d: -1)
        
    }
    
    func testMineral(){
        //Tests if the current levels in the body are too low.
        if (amount < minimum) {
            var debuffName: String
        //Additional statements check to what severity and apply the according debuff.
            if (Double(amount) >= 0.75 * Double(minimum)) {
                debuffName = "Minor Underage of \(name)"
            } else if (Double(amount) >= 0.5 * Double(minimum)) {
                debuffName = "Regular Underage of \(name)"
            } else if (Double(amount) >= 0.25 * Double(minimum)) {
                debuffName = "Major Underage of \(name)"
            } else {
                debuffName = "Grand Underage of \(name)"
            }
            debuff = Debuff(n: debuffName,d: -1)
        } else if (amount > maximum) { /*Tests if the current levels in the body are too high.*/
            var debuffName: String
            //Additional statements check to what severity and apply the according debuff.
            if (Double(amount) <= 1.25 * Double(maximum)) {
                debuffName = "Minor Overage of \(name)"
                debuff = Debuff(n: debuffName,d: -1)
            } else if (Double(amount) <= 1.5 * Double(maximum)) {
                debuffName = "Regular Overage of \(name)"
            } else if (Double(amount) <= 1.75 * Double(maximum)) {
                debuffName = "Major Overage of \(name)"
            } else {
                debuffName = "Grand Overage of \(name)"
            }
            debuff = Debuff(n: debuffName,d: -1)
        }
        
    }
    
}
