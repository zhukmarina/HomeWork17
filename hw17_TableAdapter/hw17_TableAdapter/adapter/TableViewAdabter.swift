//
//  TableViewAdabter.swift
//  hw17_TableAdapter
//
//  Created by Marina Zhukova on 19.04.2024.
//

import UIKit

class TableViewAdabter: NSObject{
    var sections: [SectionAdapterInput] = []
    
}

extension TableViewAdabter: TableViewAdabterInput {
    func setup(with tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        
        sections.forEach{
            $0.registerCells(in: tableView)
        }
    }
    
    
}
extension TableViewAdabter:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows(for: section, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].cellForRow(at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].heightForRow(at: indexPath, in: tableView)
    
    }
}

extension TableViewAdabter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sections[indexPath.section].didSelectRow(at: indexPath, in: tableView)
    }
}
