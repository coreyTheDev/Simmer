//
//  NewSessionCoordinator.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/28/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

protocol NewSessionCoordinatorDelegate: class {
    /// The user tapped the cancel button
    func newSessionCoordinatorDidCancel(newSessionCoordinator: NewSessionCoordinator)
    
    /// The user completed the order flow with the payload
    //TODO: Add completion function
    //func newSessionCoordinator(newSessionCoordinator: NewSessionCoordinator, didAdd orderPayload: NewOrderCoordinatorPayload)
}

class NewSessionCoordinator: Coordinator {
    
    weak var delegate: NewSessionCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    
    var viewController: UIViewController {
        return navigationController
    }
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    private var moods: [String]?
    
    func start() {
        let moodInputViewController = MoodInputViewController(nibName: "MoodInputViewController", bundle: Bundle.main)
        moodInputViewController.delegate = self
        navigationController.viewControllers = [moodInputViewController]
    }
    
}

extension NewSessionCoordinator: MoodInputViewControllerDelegate {
    
    func moodInputViewController(moodInputViewController: MoodInputViewController, didFinishWith moods: [String]) {
        self.moods = moods
    }
    
    func moodInputViewControllerDidCancel(moodInputViewController: MoodInputViewController) {
        delegate?.newSessionCoordinatorDidCancel(newSessionCoordinator: self)
    }
    
}
