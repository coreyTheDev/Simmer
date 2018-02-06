//
//  CustomTestAssertions.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/6/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import XCTest

struct UnexpectedNilValueError: Error {}

func AssertNotNilAndUnwrap<T>(_ value: T?, message: String = "Unexpected nil value", file: StaticString = #file, line: UInt = #line) throws -> T {
    guard let value = value else {
        XCTFail(message, file: file, line: line)
        throw UnexpectedNilValueError()
    }
    return value
}
