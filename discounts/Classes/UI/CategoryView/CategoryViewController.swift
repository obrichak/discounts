//
//  CategoryViewController.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/16/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet var categoryView: CategoryView!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.setupView()
        categoryView.owner = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "ShowMainMenu") {
            let viewController:MainMenuViewController = segue.destinationViewController as MainMenuViewController
                viewController.categoryIndex = CategoryManager.sharedManager.categoryArrayData[categoryView.getSelectedItem()].categoryId
        }
    }

}
