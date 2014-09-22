//
//  DiscountView.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/10/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class DiscountView: UIView {
    
    @IBOutlet weak var codeImageView: UIImageView!
    @IBOutlet weak var productImageLogoView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    
    
    func generateCode(productIndex:Int)
    {
        var companyObject:CompanyObject = DiscountsManager.sharedManager.discountsCategoryArrayData[productIndex]
    
        productNameLabel.text = companyObject.companyName
        productImageLogoView.image = UIImage(named: companyObject.imageName)
        
        let codeImage:UIImage = RSCode128Generator(codeTable: .A).generateCode(companyObject.discountCode, machineReadableCodeObjectType: AVMetadataObjectTypeCode128Code)!//RSUnifiedCodeGenerator.shared.generateCode(companyObject.discountCode, machineReadableCodeObjectType: AVMetadataObjectTypeCode128Code)!
        codeImageView.image = codeImage
        codeImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        codeImageView.frame = CGRectMake(codeImageView.frame.origin.x, codeImageView.frame.origin.y, codeImage.size.width, codeImage.size.height)

    }
}
