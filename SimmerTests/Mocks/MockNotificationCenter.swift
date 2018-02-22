//
//  MockNotificationCenter.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/21/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import UIKit

class MockNotificationCenter: NotificationCenter {

    var addObserverCallCount: Int = 0
    override func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        super.addObserver(observer, selector: aSelector, name: aName, object: anObject)
        addObserverCallCount += 1
    }
    
    var removeObserverCallCount: Int = 0
    override func removeObserver(_ observer: Any) {
        super.removeObserver(observer)
        removeObserverCallCount += 1
    }
}
