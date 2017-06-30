//
//  UITableView+Dequeuing.swift
//  Template
//
//  Created by Vladyslav Gusakov on 5/15/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import UIKit

extension UITableView
{
    func registerCellWithClass(_ cellClass: UITableViewCell.Type)
    {
        self.register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func registerNibWithClass(_ cellClass: UITableViewCell.Type)
    {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        self.register(nib: nib, withCellClass: cellClass)
    }
    
    func dequeueReusableCellClass(_ cellClass: UITableViewCell.Type, indexPath: IndexPath) -> UITableViewCell
    {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellClass), for: indexPath)
    }
}
