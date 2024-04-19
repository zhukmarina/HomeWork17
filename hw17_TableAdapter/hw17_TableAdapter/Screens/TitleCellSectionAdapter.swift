//
//  TitleCellSectionAdapter.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit
protocol TitleCellSectionAdapterOutput: AnyObject{
    func titleCellItemCount() -> Int
    func titleCellItem(at indexPath: IndexPath) -> TitleCellDisplayModel
}

class TitleCellSectionAdapter{
    private weak var output: TitleCellSectionAdapterOutput!
    
    required init(output: TitleCellSectionAdapterOutput) {
        self.output = output
    }
}

extension TitleCellSectionAdapter: SectionAdapterInput{
    func registerCells(in tableView: UITableView) {
        let nib = UINib(nibName: "TitleCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TitleCell")
    }
    
    func numberOfRows(for section: Int, in tableView: UITableView) -> Int {
        return output.titleCellItemCount()
    }
    
    func cellForRow(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
     
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? TitleCell
            else{
                assertionFailure()
                return UITableViewCell()
            }
            let model = output.titleCellItem(at: indexPath)
            cell.setup(with: model)
            return cell
        }
    func heightForRow(at indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return 88.0
    }
}
