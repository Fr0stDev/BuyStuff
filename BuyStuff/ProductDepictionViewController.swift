//
//  ProductDepictionViewController.swift
//  BuyStuff
//
//  Created by Guillermo Moran on 3/29/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class ProductDepictionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak private var firstButtonView: UIView!
    @IBOutlet weak private var secondButtonView: UIView!
    
    @IBOutlet weak private var productImageView: UIImageView!
    
    @IBOutlet weak private var productNameLabel: UILabel!
    @IBOutlet weak private var productDescriptionLabel: UILabel!
    
    @IBOutlet weak private var quantityField: UITextField!
    
    @IBOutlet weak private var pricePerItemLabel: UILabel!
    @IBOutlet weak private var totalPriceLabel: UILabel!
    @IBOutlet weak private var productDescriptionTextView: UITextView!
    
    var productName : String?
    var productShortDescription : String?
    var productLongDescription : String?
    var productPrice : Double = 0.00
    
    var productPreviewImage : UIImage?
    
    let BAR_COLOR = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.0)
    let VIEW_COLOR = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantityField.delegate = self
        
        self.view.backgroundColor = VIEW_COLOR
        
        firstButtonView .backgroundColor  = UIColor.white
        secondButtonView.backgroundColor  = UIColor.white
        
        firstButtonView .layer.borderWidth  = 1
        firstButtonView .layer.borderColor  = VIEW_COLOR.cgColor
        
        secondButtonView.layer.borderWidth = 1
        secondButtonView.layer.borderColor = VIEW_COLOR.cgColor
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(self.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ProductDepictionViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ProductDepictionViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //Set data stuff 
        self.productImageView.image = productPreviewImage
        self.productNameLabel.text = productName
        self.productDescriptionLabel.text = productShortDescription
        self.productDescriptionTextView.text = productLongDescription
        self.pricePerItemLabel.text = "$\(productPrice) / each"
        self.totalPriceLabel.text = "$\(productPrice)"
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //Dismiss Keyboard
    func didTapView(){
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let quantity = Double(quantityField.text!)
        self.totalPriceLabel.text = "$\(productPrice * quantity!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController!.popViewController(animated: true);
        
    }
    
    @IBAction func addToCart(_ sender: Any) {
        
        let quantity = Int(quantityField.text!)
        
        cartManager.addItemToCart(name: productName!, shortDescription: productShortDescription!, longDescription: productLongDescription!, price: productPrice, previewImage: productPreviewImage!, quantity: quantity!)
        
        let alert = UIAlertController(title: "Done!", message: "Your item was added to your cart", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        tabBarController?.tabBar.items![1].badgeValue = String(cartManager.items.count)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
