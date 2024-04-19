//
//  DataLoader.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import Foundation


class DataLoader {
    func getSwitcherData()->[SwitcherCellDisplayModel]{
        var models : [SwitcherCellDisplayModel] = []
        
        for i in 0...3{
            let newModel = SwitcherCellDisplayModel(title: "Settings: \(i+1)", isOn: false)
            models.append(newModel)
        }
        return models
    }
    
    func getBuyData()->[BuyCellDisplayModel]{
        var models : [BuyCellDisplayModel] = []
        
        for i in 0...4{
            let newModel = BuyCellDisplayModel(title: "Title: \(i+1)")
            models.append(newModel)
        }
        return models
    }
    
    func getTitleData()->[TitleCellDisplayModel]{
        var models : [TitleCellDisplayModel] = []
        
        for i in 0...2{
            let newModel = TitleCellDisplayModel(title: "Title: \(i+1)")
            models.append(newModel)
        }
        return models
    }
}
