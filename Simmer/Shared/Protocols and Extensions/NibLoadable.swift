//
//  NibLoadable.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/14/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable {
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func create(owner: Any? = nil) -> Self {
        let bundle = Bundle(for: Self.self)
        guard let view = bundle.loadNibNamed(Self.nibName, owner: owner, options: nil)?[0] as? Self else {
            fatalError("Could not instantiate \(Self.self) from nib -- have you conformed to the NibLoadableView protocol?")
        }
        
        return view
    }
    
}

extension UICollectionViewCell: NibLoadable { }
