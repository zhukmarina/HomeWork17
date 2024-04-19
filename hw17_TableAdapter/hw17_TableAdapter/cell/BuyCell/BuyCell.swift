//
//  BuyCell.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit

class BuyCell : UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var buyButton: UIButton!
    
    func setup(with model : BuyCellDisplayModel){
        titleLabel.text = model.title
        descriptionLabel.text = "description"
        buyButton.setTitle("Buy", for: .normal)
    }
}
