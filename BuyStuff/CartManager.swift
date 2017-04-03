//
//  CartManager.swift
//  BuyStuff
//
//  Created by Guillermo Moran on 3/30/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

var cartManager : CartManager = CartManager()

struct cartItem {
    var name = "null"
    var shortDescription = "null"
    var longDescriptionn = "null"
    var price = 0.00
    var previewImage : UIImage? = nil
    var quantity : Int = 0
}

class CartManager: NSObject {
    
    var items = [cartItem]()

    func addItemToCart(name : String, shortDescription : String, longDescription : String, price : Double, previewImage : UIImage, quantity: Int) {
    
        items.append(cartItem(name: name, shortDescription: shortDescription, longDescriptionn: longDescription, price: price, previewImage: previewImage, quantity: quantity))
    
    }
    
}
