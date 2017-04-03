//
//  HotProductListManager.swift
//  BuyStuff
//
//  Created by Guillermo Moran on 3/30/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

var hotProductListManager : HotProductListManager = HotProductListManager()

struct product {
    var name = "null"
    var shortDescription = "null"
    var longDescriptionn = "null"
    var price = 0.00
    var previewImage : UIImage? = nil
}

class HotProductListManager: NSObject {
    
    var products = [product]()
    
    func addProduct(name : String, shortDescription : String, longDescription : String, price : Double, previewImage : UIImage) {
        
        products.append(product(name: name, shortDescription: shortDescription, longDescriptionn: longDescription, price: price, previewImage: previewImage))
        
    }

}
