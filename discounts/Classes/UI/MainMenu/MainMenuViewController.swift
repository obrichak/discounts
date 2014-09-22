//
//  MainMenuViewController.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/10/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import Foundation
import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet var mainMenuView: MainMenuView!
    
    var categoryIndex:Int = 0
    
    override func viewDidLoad() {
        mainMenuView.setupView(categoryIndex)
        mainMenuView.owner = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showDiscount") {
            let viewController:DiscountViewController = segue.destinationViewController as DiscountViewController
            viewController.selectedIndex = mainMenuView.selectedIndex
        }
    }

}
