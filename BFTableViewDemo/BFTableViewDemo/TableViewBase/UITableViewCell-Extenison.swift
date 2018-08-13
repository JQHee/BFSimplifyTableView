//
//  UITableViewCell-Extenison.swift
//  BFTableViewDemo
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation
import UIKit

public extension UITableViewCell {
    
    class internal func nibWithIdentifier(identifier: String) -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    /**
     从nib文件中根据重用标识符注册UITableViewCell
     
     - parameter table:      table description
     - parameter identifier: identifier description
     */
    class func registerTable(table: UITableView, nibIdentifier identifier: String) {
        return table.register(self.nibWithIdentifier(identifier: identifier), forCellReuseIdentifier: identifier)
    }
    
    /**
     配置UITableViewCell，设置UITableViewCell内容
     - parameter cell:      cell description
     - parameter obj:       obj description
     - parameter indexPath: indexPath description
     */
    func configure(cell: UITableViewCell, customObj obj: Any, indexPath: IndexPath) {
        // Rewrite this func in SubClass !
    }
    
    /**
     获取自定义对象的cell高度
     - parameter obj:       obj description
     - parameter indexPath: indexPath description
     - returns: return value description
     */
    func getRowHeight(obj: Any, indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

}
