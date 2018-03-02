//
//  AppCoordinator.swift
//  Simmer
//
//  Created by Corey Zanotti on 3/2/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var childCoordinators: [Coordinator] = []
    
    var viewController: UIViewController {
        return self.navigationController
    }
    
    /// Window to manage
    let window: UIWindow
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    // MARK: - Init
    
    public init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = self.viewController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        let sessionListViewController = SessionListViewController(nibName: SessionListViewController.nibName, bundle: nil)
        navigationController.viewControllers = [sessionListViewController]
    }
    
}
