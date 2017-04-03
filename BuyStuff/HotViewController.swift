//
//  HotViewController.swift
//  BuyStuff
//
//  Created by Guillermo Moran on 3/29/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

//https://coolors.co/f7f7f7-54dd9b-e2673b-59c9a5-5b6c5d 

import UIKit

class HotViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var fakeNavBar: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = ["1", "2", "3", "4", "5", "6", "7"]

    
    let BAR_COLOR = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
    let VIEW_COLOR = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    let GREEN_COLOR = UIColor(red:0.33, green:0.87, blue:0.61, alpha:1.0).withAlphaComponent(0.9)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = VIEW_COLOR
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        loadHotProductList()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadHotProductList() {
        hotProductListManager.addProduct(name: "Cholo Shirt", shortDescription: "Streetwear Collection", longDescription: "Let all the hood boys know who's really the boss with the 'Cholo Shirt', from the 2017 Streetwear Collection from BuyStuff.", price: 44.99, previewImage: #imageLiteral(resourceName: "cholo_shirt"))
        
        hotProductListManager.addProduct(name: "Ugly Sweater", shortDescription: "Discount Items", longDescription: "Love getting strange looks from complete strangers at Walmart? Enjoy sweating buckets on a hot spring afternoon? Answer yes to any of these questions? Then the 2015 Christmas Collection ugly sweater is the perfect gift for yourself. Go on, win that ugly sweater contest. Nothing's stopping you now!", price: 9.99, previewImage: #imageLiteral(resourceName: "ugly_shirt"))
        
        hotProductListManager.addProduct(name: "Big Horse Shirt", shortDescription: "Fashion Collection", longDescription: "A shirt with a big horse.", price: 59.99, previewImage: #imageLiteral(resourceName: "ralph"))
        
        hotProductListManager.addProduct(name: "Plaid Shirt", shortDescription: "Plaid Collection", longDescription: "A plaid shirt.", price: 39.99, previewImage: #imageLiteral(resourceName: "plaid_shirt"))
        
        hotProductListManager.addProduct(name: "Potted Plant", shortDescription: "Home Improvement", longDescription: "Just a potted plant.", price: 21.99, previewImage: #imageLiteral(resourceName: "plant"))
        
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return hotProductListManager.products.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath as IndexPath) as! ItemCollectionViewCell
        
        //Cell Setup
        
        cell.priceLabel.textColor = UIColor.white
        cell.priceView.backgroundColor = GREEN_COLOR
        
        cell.priceView.layer.cornerRadius = 15
        cell.priceView.layer.borderWidth = 2
        cell.priceView.layer.borderColor = UIColor.clear.cgColor
        
        // set data
        let index = indexPath.item
        let product = hotProductListManager.products[index]
        
        cell.previewImage.image = product.previewImage
        cell.priceLabel.text = "$\(product.price)"
        
        
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        let depictionVC = self.storyboard?.instantiateViewController(withIdentifier: "depictionVC")
            as! ProductDepictionViewController
        
        // set data
        let index = indexPath.item
        let product = hotProductListManager.products[index]
        
        depictionVC.productName = product.name
        depictionVC.productShortDescription = product.shortDescription
        depictionVC.productLongDescription = product.longDescriptionn
        depictionVC.productPrice = product.price
        depictionVC.productPreviewImage = product.previewImage
        
        self.show(depictionVC, sender: nil)
        
    }


}

