//
//  Coordinator.swift
//  Simmer
//
//  Created by Corey Zanotti on 3/2/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

/// The Coordinator protocol
public protocol Coordinator: class {
    
    /// The services that the coordinator can use
    //var services: Services { get }
    
    /// The array containing any child Coordinators
    var childCoordinators: [Coordinator] { get set }
    
    var viewController: UIViewController { get }
}

public extension Coordinator {
    
    /// Add a child coordinator to the parent
    public func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    /// Remove a child coordinator from the parent
    public func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
    
}
