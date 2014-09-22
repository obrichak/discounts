//
//  CategoryView.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/16/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import UIKit


let cellIdent = "CategoryCell"

class CategoryView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var categoryView: UICollectionView!
    var owner:UIViewController!
    var selectedItem:Int!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    func setupView()
    {
        CategoryManager.sharedManager.loadDataFromJSON("Category")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return CategoryManager.sharedManager.categoryArrayData.count
    }

    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdent, forIndexPath: indexPath) as CategoryViewCell
        cell.categoryNameLabel.text  = CategoryManager.sharedManager.categoryArrayData[indexPath.row].categoryName
        cell.categoryImageView.image  = UIImage(named: CategoryManager.sharedManager.categoryArrayData[indexPath.row].categoryImageName)
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        selectedItem = indexPath.row
        owner?.performSegueWithIdentifier("ShowMainMenu", sender: owner)
    }
  
    func getSelectedItem()->Int
    {
        return selectedItem
    }

}
