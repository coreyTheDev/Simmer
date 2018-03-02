//
//  UINavigationBar+Appearance.swift
//  Simmer
//
//  Created by Corey Zanotti on 3/1/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    static func setupAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.darkOrange()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.darkBlue()
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
    }
    
}
