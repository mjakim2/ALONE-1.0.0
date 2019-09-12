//
//  ShopViewController.swift
//  A Lovely Onmiscient Networking Experience
//
//  Created by Oliver  Jakimovski on 9/4/19.
//  Copyright © 2019 Monsters & Minecarts. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var storeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var switchButton: UIButton!
    @IBOutlet var tradeButton: UIButton!
    
    var shopIsSelling: Bool = true
    var shopIndex: Int = 0
    var worlds: Array<WorldClass> = []
    var worldNumber: Int = 1
    var questNumber: Int = 1
    var shopNumber: Int = 1
    var inventoryIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextItemAction(_ sender: UIButton) {
        if (shopIsSelling) {
            
        } else {
            
        }
    }
    
    @IBAction func previousItemAction(_ sender: UIButton) {
        if (shopIsSelling) {
            
        } else {
            
        }
    }
    
    @IBAction func tradeAction(_ sender: UIButton) {
    }

    @IBAction func switchAction(_ sender: UIButton) {
        shopIsSelling = !shopIsSelling
        setItem()
    }
    
    //Set the item depending on the slot and the array.
    func setItem () {
        
        if (shopIsSelling) {
            
            if (shopIndex >= 0) {
                itemImageView.image = UIImage(named: worlds[worldNumber].shops[shopNumber].items[shopIndex].name)
            }
            
        } else {
            
            if (inventoryIndex >= 0) {
                itemImageView.image = UIImage(named: worlds[worldNumber].shops[shopNumber].items[inventoryIndex].name)
            }
            
        }
        
    }
    
}
