//
//  KeyboardNotificationHandlerTests.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/21/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import UIKit
import XCTest
@testable import Simmer

class KeyboardNotificationHandlerTests: XCTestCase {

    private var keyboardNotificationHandler: KeyboardNotificationHandler!
    private var scrollView: UIScrollView!
    private var mockNotificationCenter: MockNotificationCenter!
    
    override func setUp() {
        super.setUp()
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        mockNotificationCenter = MockNotificationCenter()
        keyboardNotificationHandler = KeyboardNotificationHandler(scrollView: scrollView, notificationCenter: mockNotificationCenter)
    }
    
    // MARK: - Tests
    
    func test_init_itAddsObserversToNotificationCenter() {
        let expected = 2
        let actual = mockNotificationCenter.addObserverCallCount
        XCTAssertEqual(actual, expected)
    }
    
    func test_deinit_itRemovesObserversToNotifications() {
        let expected = 1
        keyboardNotificationHandler = nil
        let actual = mockNotificationCenter.removeObserverCallCount
        XCTAssertEqual(actual, expected)
    }
    
    func test_keyboardDidShow_itUpdatesTheScrollViewsContentInset() {
        // Arrange
        let expected: CGFloat = 150
        let keyboardDidShowNotification = Notification(name: Notification.Name.UIKeyboardDidShow, object: nil, userInfo: [UIKeyboardFrameEndUserInfoKey : CGRect(x: 0, y: 0, width: 300, height: expected)])
        
        // Act
        mockNotificationCenter.post(keyboardDidShowNotification)
        
        // Assert
        let actual = scrollView.contentInset.bottom
        XCTAssertEqual(actual, expected)
    }
    
    func test_keyboardDidShow_itUpdatesTheScrollViewsScrollIndicatorInset() {
        // Arrange
        let expected: CGFloat = 150
        let keyboardDidShowNotification = Notification(name: Notification.Name.UIKeyboardDidShow, object: nil, userInfo: [UIKeyboardFrameEndUserInfoKey : CGRect(x: 0, y: 0, width: 300, height: expected)])
        
        // Act
        mockNotificationCenter.post(keyboardDidShowNotification)
        
        // Assert
        let actual = scrollView.scrollIndicatorInsets.bottom
        XCTAssertEqual(actual, expected)
    }
    
    func test_keyboardWillHide_itResetsTheScrollViewsContentInset() {
        // Arrange
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        let expected: CGFloat = 0
        let keyboardDidShowNotification = Notification(name: Notification.Name.UIKeyboardWillHide, object: nil, userInfo: nil)
        
        // Act
        mockNotificationCenter.post(keyboardDidShowNotification)
        
        // Assert
        let actual = scrollView.contentInset.bottom
        XCTAssertEqual(actual, expected)
    }
    
    func test_keyboardWillHide_itResetsTheScrollViewsScrollIndicatorInset() {
        // Arrange
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        let expected: CGFloat = 0
        let keyboardDidShowNotification = Notification(name: Notification.Name.UIKeyboardWillHide, object: nil, userInfo: nil)
        
        // Act
        mockNotificationCenter.post(keyboardDidShowNotification)
        
        // Assert
        let actual = scrollView.scrollIndicatorInsets.bottom
        XCTAssertEqual(actual, expected)
    }
    
}
