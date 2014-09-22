//
//  DiscountsManager.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/15/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import Foundation

class DiscountsManager {
    
    class var sharedManager: DiscountsManager {
    struct Static {
        static var instance: DiscountsManager?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = DiscountsManager()
        }
        return Static.instance!
    }

    var discountsArrayData = Array<CompanyObject>()
    var discountsCategoryArrayData = Array<CompanyObject>()

    func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
        let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json")
        if (path == nil) {
            println("Could not find level file: \(filename)")
            return nil
        }
        
        var error: NSError?
        let data: NSData? = NSData(contentsOfFile: path!, options: NSDataReadingOptions(), error: &error)
        if data == nil {
            println("Could not load level file: \(filename), error: \(error!)")
            return nil
        }
        
        let dictionary: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(), error: &error)
        if (dictionary == nil) {
            println("Level file '\(filename)' is not valid JSON: \(error!)")
            return nil
        }
        
        return dictionary as? Dictionary<String, AnyObject>
    }

    
    func loadDataFromJSON(filename: String)
    {
        if(discountsArrayData.count > 0)
        {
            return;
        }
        if let dictionary = self.loadJSONFromBundle(filename)
        {
            let companysArray: NSArray? = dictionary["companys"] as NSArray?
            
            if (companysArray != nil)
            {
                for item in companysArray!
                {
                    var discount:CompanyObject = CompanyObject()
                    
                    // we convert each key to a String
                    discount.companyId = item["companyId"] as Int
                    discount.categoryId = item["categoryId"] as Int
                    discount.companyName = item["companyName"] as String
                    discount.discount = item["discount"] as String
                    discount.imageName = item["imageName"] as String
                    discount.discountCode = item["discountCode"] as String
                    discountsArrayData.append(discount)
                }
            }
        }
    }
    
    func getCompanyWithCategory(categoryIndex: Int)
    {
        if(discountsCategoryArrayData.count > 0)
        {
            discountsCategoryArrayData.removeAll(keepCapacity: false)
            discountsCategoryArrayData = Array<CompanyObject>()
        }
        println("\n array count: \(discountsCategoryArrayData.count) \n")
        for var i = 0; i < discountsArrayData.count; i++ {
           var discount:CompanyObject = discountsArrayData[i]
            if(discount.categoryId == categoryIndex)
            {
               discountsCategoryArrayData.append(discount)
            }
        }
        println("\n array count: \(discountsCategoryArrayData.count) \n")
        println(discountsCategoryArrayData)
    }
    
}