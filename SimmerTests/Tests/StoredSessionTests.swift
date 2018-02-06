//
//  StoredSessionTests.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/6/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import XCTest
@testable import Simmer

final class StoredSessionTests: XCTestCase {
    
    // test that it creates a displayable session with the proper values
    func test_createDisplayableSession_itCreatesAndSetsUpDisplayableSession() throws {
        // Arrange
        let storedSession = StoredSession()
        storedSession.title = "Test"
        let expected = DisplayableSession(title: "Test")
        
        // Act
        let actual = try AssertNotNilAndUnwrap(storedSession.createDisplayableSession())
        
        // Assert
        XCTAssertEqual(actual, expected)
    }
}
