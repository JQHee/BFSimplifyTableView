//
//  BFBaseTableViewManger.swift
//  BFTableViewDemo
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

/// 选中UITableViewCell的Block
typealias didSelectTableCellBlock = (IndexPath, Any) -> Void

class BFBaseTableViewManger: NSObject {
    
    private var myCellIdentifier =  ""
    lazy var dataArrayList = []
    var didSelectCellBlock: didSelectTableCellBlock?
    
    init(cellIdentifier: String, didSelectBlock: @escaping didSelectTableCellBlock) {
        super.init()
        self.myCellIdentifier = cellIdentifier
        self.didSelectCellBlock = didSelectBlock
    }
    
    /**
     设置UITableView的Datasource和Delegate为self
     - parameter table: UITableView
     */
    func handleTableViewDatasourceAndDelegate(table: UITableView) {
        table.dataSource = self
        table.delegate   = self
    }
    
}

// MARK: - UITableViewDataSource
extension BFBaseTableViewManger: UITableViewDataSource {
    
    /**
     获取UITableView中Item所在的indexPath
     
     - parameter indexPath: indexPath
     
     - returns: return value description
     */
    func itemAtIndexPath(indexPath: IndexPath) -> Any {
        return dataArrayList[indexPath.row] as Any
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: Any = itemAtIndexPath(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: myCellIdentifier)
        if cell == nil {
            UITableViewCell.registerTable(table: tableView, nibIdentifier: myCellIdentifier)
        }
        cell?.configure(cell: cell!, customObj: item, indexPath: indexPath)
        return cell!
    }
}

// MARK: - UITableViewDelegate
extension BFBaseTableViewManger: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.cellForRow(at: indexPath)
        let item: Any = itemAtIndexPath(indexPath: indexPath)
        return (cell?.getRowHeight(obj: item,indexPath: indexPath))!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item: Any = itemAtIndexPath(indexPath: indexPath)
        if let _ = didSelectCellBlock {
            didSelectCellBlock!(indexPath, item)
        }
    }
}
