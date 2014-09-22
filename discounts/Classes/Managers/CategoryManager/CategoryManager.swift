//
//  CategoryManager.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/16/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import Foundation

class CategoryManager {
    
    class var sharedManager: CategoryManager {
    struct Static {
        static var instance: CategoryManager?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = CategoryManager()
        }
        return Static.instance!
    }
    
    var categoryArrayData = Array<CategoryObject>()
    
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
        if let dictionary = self.loadJSONFromBundle(filename)
        {
            let categoryArray: NSArray? = dictionary["category"] as NSArray?
            
            if (categoryArray != nil)
            {
                for item in categoryArray!
                {
                    var category:CategoryObject = CategoryObject()
                    
                    // we convert each key to a String
                    category.categoryId = item["categoryId"] as Int
                    category.categoryName = item["categoryName"] as String
                    category.categoryImageName = item["categoryImageName"] as String
                    categoryArrayData.append(category)
                }
            }
        }
    }
}