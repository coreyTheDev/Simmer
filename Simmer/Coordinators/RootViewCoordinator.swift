//
//  RootViewCoordinator.swift
//  Simmer
//
//  Created by Corey Zanotti on 3/2/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

protocol RootViewControllerProvider {
    var rootViewController: UIViewController { get }
}

typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
