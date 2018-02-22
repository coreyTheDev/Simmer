//
//  DisplayableSessionCell.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/11/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

protocol DisplayableSessionCell {
    func configure(with displayableSession: DisplayableSession)
}

extension DisplayableSessionCell where Self: UITableViewCell {
    func configure(with displayableSession: DisplayableSession) {
        self.textLabel?.text = displayableSession.title
    }
}

extension UITableViewCell: DisplayableSessionCell { }
//extension UITableViewCell: DisplayableSessionCell {
//
//    func configure(with displayableSession: DisplayableSession) {
//        self.textLabel?.text = displayableSession.title
//    }
//
//}

