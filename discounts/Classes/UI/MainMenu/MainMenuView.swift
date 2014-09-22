//
//  MainMenuView.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/10/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import Foundation
import UIKit

let cellName = "CellIdent"

class MainMenuView: UIView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var owner:UIViewController!
    var selectedIndex:Int!
    
    
    func setupView(categoryIndex:Int)
    {
        DiscountsManager.sharedManager.loadDataFromJSON("Company")
        DiscountsManager.sharedManager.getCompanyWithCategory(categoryIndex)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DiscountsManager.sharedManager.discountsCategoryArrayData.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:DiscountTableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellName) as DiscountTableViewCell
        var tmp_cmp:CompanyObject = DiscountsManager.sharedManager.discountsCategoryArrayData[indexPath.row]
        
        cell.company = tmp_cmp
        cell.setupCell()
        return cell
    }

    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        selectedIndex = indexPath.row
        owner?.performSegueWithIdentifier("showDiscount", sender: owner)
    }
}
