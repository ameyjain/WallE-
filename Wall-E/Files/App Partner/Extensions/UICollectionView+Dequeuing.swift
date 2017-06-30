//
//  UICollectionView+Dequeuing.swift
//  Template
//
//  Created by Vladyslav Gusakov on 6/8/17.
//  Copyright © 2017 AppPartner. All rights reserved.
//

import Foundation

extension UICollectionView
{
    func registerCellWithClass(_ cellClass: UICollectionViewCell.Type)
    {
        self.register(cellWithClass: cellClass)
    }
    
    func registerNibWithClass(_ cellClass: UICollectionViewCell.Type)
    {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        self.register(nib: nib, forCellWithClass: cellClass)
    }
    
    func dequeueReusableCellClass(_ cellClass: UICollectionViewCell.Type, indexPath: IndexPath) -> UICollectionViewCell
    {
        return self.dequeReusableCell(withClass: cellClass, for: indexPath)
    }
}
