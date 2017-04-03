//
//  InitialViewController.swift
//  BuyStuff
//
//  Created by Guillermo Moran on 3/29/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    let GREEN_COLOR = UIColor(red:0.33, green:0.87, blue:0.61, alpha:1.0).withAlphaComponent(0.9)

    
    @IBOutlet weak var startButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //round button
        
        startButton.backgroundColor = GREEN_COLOR
        startButton.layer.cornerRadius = 30
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = UIColor.clear.cgColor
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startShopping(_ sender: Any) {
        
        let tabViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabViewController")
            as! UITabBarController
        
        tabViewController.modalTransitionStyle = .crossDissolve
        
        self.present(tabViewController, animated: true, completion: nil)
        
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
