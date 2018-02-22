//
//  KeyboardNotificationHandler.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/21/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardNotificationHandlerDelegate: class {
    func keyboardDidShow(_ notificationHandler: KeyboardNotificationHandler)
    func keyboardWillHide(_ notificationHandler: KeyboardNotificationHandler)
}

class KeyboardNotificationHandler {
    
    weak var scrollView: UIScrollView?
    weak var delegate: KeyboardNotificationHandlerDelegate?
    
    private let notificationCenter: NotificationCenter
    
    init(scrollView: UIScrollView, notificationCenter: NotificationCenter = NotificationCenter.default) {
        self.scrollView = scrollView
        self.notificationCenter = notificationCenter
        
        registerForNotifications()
    }
    
    deinit {
        removeNotifications()
    }
    
    // MARK: - Setup
    
    private func registerForNotifications() {
        notificationCenter.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private func removeNotifications() {
        notificationCenter.removeObserver(self)
    }
    
    // MARK: - Notification handling
    
    @objc private func keyboardDidShow(notification: Notification) {
        guard
            let scrollView = scrollView,
            let userInfo = notification.userInfo,
            let keyboardEndFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
            else {
                return
        }
        
        let keyboardEndFrame = keyboardEndFrameValue.cgRectValue
        scrollView.contentInset.bottom = keyboardEndFrame.height
        scrollView.scrollIndicatorInsets.bottom = keyboardEndFrame.height
        
        delegate?.keyboardDidShow(self)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        guard let scrollView = scrollView else {
            return
        }
        
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        
        delegate?.keyboardWillHide(self)
    }
    
}
