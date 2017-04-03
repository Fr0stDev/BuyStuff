//
//  CartViewController.swift
//  BuyStuff
//
//  Created by Guillermo Moran on 3/30/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let VIEW_COLOR = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        reloadTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        cartTableView.backgroundColor = VIEW_COLOR
        cartTableView.separatorColor = VIEW_COLOR

        // Do any additional setup after loading the view.
    }
    
    func reloadTable() {
        var totalPrice = 0.00
        for var i in 0 ..< cartManager.items.count {
            totalPrice += cartManager.items[i].price * Double(cartManager.items[i].quantity)
        }
        totalPriceLabel.text = "$\(totalPrice)"
        cartTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkOut(_ sender: Any) {
        
        let alert = UIAlertController(title: "Closed.", message: "The Store Is Not Open Yet.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableCell
        
        let index = indexPath.row
        let item = cartManager.items[index]
        
        cell.productNameLabel.text = item.name
        cell.productShortDescriptionLabel.text = item.shortDescription
        cell.productImage.image = item.previewImage
        cell.quantityLabel.text = String(item.quantity)
        cell.priceLabel.text = "$\(item.price)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            
            cartManager.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
            
            
            
            if (cartManager.items.count == 0) {
                tabBarController?.tabBar.items![1].badgeValue = nil
            }
            else {
                var quantity : Int = 0
                
                for var i in 0 ..< cartManager.items.count {
                    quantity += Int(cartManager.items[i].quantity)
                }
                
                tabBarController?.tabBar.items![1].badgeValue = String(quantity)

            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartManager.items.count
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
