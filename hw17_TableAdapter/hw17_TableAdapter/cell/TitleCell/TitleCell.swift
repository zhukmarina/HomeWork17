//
//  TitleCell.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit

class TitleCell : UITableViewCell{
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var arrowButton: UIButton!
    
    func setup(with model : TitleCellDisplayModel){
        titleLabel.text = model.title
    }
    
}
