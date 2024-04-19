//
//  SwitcherCell.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit

class SwitcherCell : UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    func setup(with model : SwitcherCellDisplayModel){
        titleLabel.text = model.title
        switcher.isOn = model.isOn
    }
}
