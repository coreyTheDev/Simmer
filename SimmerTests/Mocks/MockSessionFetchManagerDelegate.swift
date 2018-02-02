//
//  MockSessionFetchManagerDelegate.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/2/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
@testable import Simmer

final class MockFetchManagerDelegate: FetchManagerDelegate {
    
    var fetchCompletedCallCount = 0
    func fetchCompleted(with result: FetchResult) {
        fetchCompletedCallCount += 1
    }
    
}
