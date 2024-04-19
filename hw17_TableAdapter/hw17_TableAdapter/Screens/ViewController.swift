//
//  ViewController.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableAdapter: TableViewAdabterInput!
    
    var switchableModels: [SwitcherCellDisplayModel] = []
    var buyModels: [BuyCellDisplayModel] = []
    var titleCellModels: [TitleCellDisplayModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchableModels = DataLoader().getSwitcherData()
        buyModels = DataLoader().getBuyData()
        titleCellModels = DataLoader().getTitleData()
        
      
        let switchableSection = SwitchableSectionAdapter(output: self)
        let buySection = BuySectionAdapter(output: self)
        let titleCellSection = TitleCellSectionAdapter(output: self)
        
        let adapter = TableViewAdabter()
        adapter.sections = [
            titleCellSection,
            switchableSection,
            buySection
            
        ]
        
        tableAdapter = adapter
        tableAdapter.setup(with: tableView)
    }


}

extension ViewController:SwitchableSectionAdapterOutput{
    func switchItemCount() -> Int {
        return switchableModels.count
    }
    
    func switchItem(at indexPath: IndexPath) -> SwitcherCellDisplayModel {
        return switchableModels[indexPath.row]
    }
    
    
}

extension ViewController: BuySectionAdapterOutput{
    func buyItemCount() -> Int {
        return buyModels.count
    }
    
    func buyItem(at indexPath: IndexPath) -> BuyCellDisplayModel {
        return buyModels[indexPath.row]
    }
    
    
}

extension ViewController: TitleCellSectionAdapterOutput{
    func titleCellItemCount() -> Int {
        return titleCellModels.count
    }
    
    func titleCellItem(at indexPath: IndexPath) -> TitleCellDisplayModel {
        return titleCellModels[indexPath.row]    }
    
    
}
