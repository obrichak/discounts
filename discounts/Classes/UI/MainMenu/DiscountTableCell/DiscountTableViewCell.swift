//
//  DiscountTableViewCell.swift
//  discounts
//
//  Created by Alexandr Chernyy on 9/15/14.
//  Copyright (c) 2014 Alexandr Chernyy. All rights reserved.
//

import UIKit

class DiscountTableViewCell: UITableViewCell {

    var company:CompanyObject?
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var discountLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell() {
       companyName.text = company?.companyName
        discountLabel.text = company?.discount
        discountLabel.adjustsFontSizeToFitWidth = true
        var fileName:String? = company?.imageName
        companyImageView.image = UIImage(named: fileName!)
    }

}
