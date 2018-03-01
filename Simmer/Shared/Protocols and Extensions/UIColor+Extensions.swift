//
//  UIColor+Extensions.swift
//  Simmer
//
//  Created by Corey Zanotti on 3/1/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func darkBrown() -> UIColor {
        return UIColor.color(from: 0xB2834A)
    }
    
    static func lightOrange() -> UIColor {
        return UIColor.color(from: 0xFFA83D)
    }
    
    static func darkOrange() -> UIColor {
        return UIColor.color(from: 0xFF8D00)
    }
    
    static func lightBlue() -> UIColor {
        return UIColor.color(from: 0x8FDAFF)
    }
    
    static func darkBlue() -> UIColor {
        return UIColor.color(from: 0x0077B2)
    }
    
    static func color(from hex: UInt32, alpha: CGFloat = 1) -> UIColor {
        
        let divisor = CGFloat(255)
        let red     = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex & 0x0000FF       ) / divisor
        
        return UIColor(red: red, green: green, blue: blue, alpha: fmax(0, fmin(alpha, 1)))
    }
    
}
