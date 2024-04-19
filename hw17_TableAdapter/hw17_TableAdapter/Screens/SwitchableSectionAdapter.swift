//
//  SwitchableSectionAdapter.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit

protocol SwitchableSectionAdapterOutput: AnyObject {
    func switchItemCount() -> Int
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel
}

class SwitchableSectionAdapter{
 
    private weak var output: SwitchableSectionAdapterOutput!
    
    required init(output: SwitchableSectionAdapterOutput) {
        self.output = output
    }
}

extension SwitchableSectionAdapter: SectionAdapterInput{
    func registerCells(in tableView: UITableView) {
        let nib = UINib(nibName: "SwitcherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SwitcherCell")
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.switchItemCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
     
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitcherCell", for: indexPath) as? SwitcherCell
            else{
                assertionFailure()
                return UITableViewCell()
            }
            let model = output.switchItem(at: indexPath)
            cell.setup(with: model)
            return cell
        }
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 66.0
    }
}
