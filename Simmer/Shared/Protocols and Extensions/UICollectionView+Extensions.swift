//
//  UICollectionView+Extensions.swift
//  Simmer
//
//  Created by Corey Zanotti on 3/1/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func displayableWidth() -> CGFloat {
        return frame.width - contentInset.left - contentInset.right
    }
    
}
