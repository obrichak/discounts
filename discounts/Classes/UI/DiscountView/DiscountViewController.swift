//
//  DiscountViewController.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/10/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import Foundation
import UIKit

class DiscountViewController: UIViewController {
    
    @IBOutlet var discountView: DiscountView!
    
    var selectedIndex:Int!
    override func viewDidLoad() {
        discountView.generateCode(selectedIndex)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
