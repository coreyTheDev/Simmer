//
//  FetchManagerTests.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 1/26/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import XCTest
@testable import Simmer

final class FetchManagerTests: XCTestCase {
    
    private var fetchManager: FetchManager!
    private var fetchManagerDelegate: MockFetchManagerDelegate!
    
    override func setUp() {
        super.setUp()
        fetchManagerDelegate = MockFetchManagerDelegate()
        fetchManager = FetchManager(resolver: MockFetchResolver())
        fetchManager.delegate = fetchManagerDelegate
    }
    
    func test_whenFetchCompletes_delegateIsCalled() {
        // Arrange
        
        // Act
        fetchManager.fetchSessions()
        
        // Assert
        let actual = fetchManagerDelegate.fetchCompletedCallCount
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
}
