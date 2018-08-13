//
//  UITableView-Extension.swift
//  BFTableViewDemo
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    private struct AssociatedKey {
        static var viewExtension = "viewExtension"
    }
    
    var tableHander: BFBaseTableViewManger {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.viewExtension) as! BFBaseTableViewManger
        }
        set {
            newValue.handleTableViewDatasourceAndDelegate(table: self)
            objc_setAssociatedObject(self, &AssociatedKey.viewExtension, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
