//
//  BuySectionAdapter.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit
protocol BuySectionAdapterOutput: AnyObject{
    func buyItemCount() -> Int
    func buyItem(at indexPath: IndexPath) -> BuyCellDisplayModel
}

class BuySectionAdapter{
    private weak var output: BuySectionAdapterOutput!
    
    required init(output: BuySectionAdapterOutput) {
        self.output = output
    }
}

extension BuySectionAdapter: SectionAdapterInput{
    func registerCells(in tableView: UITableView) {
        let nib = UINib(nibName: "BuyCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BuyCell")
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.buyItemCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
     
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BuyCell", for: indexPath) as? BuyCell
            else{
                assertionFailure()
                return UITableViewCell()
            }
            let model = output.buyItem(at: indexPath)
            cell.setup(with: model)
            return cell
        }
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 88.0
    }
    
    
}
