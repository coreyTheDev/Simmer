//
//  RealmFetchResolverTests.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/6/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

@testable import Simmer
import XCTest

final class RealmFetchResolverTests: XCTestCase {
    
    private var realmManager: RealmManager!
    private var fetchResolver: RealmFetchResolver!
    
    override func setUp() {
        super.setUp()
        realmManager = MockRealmManager()
        fetchResolver = RealmFetchResolver(realmManager: realmManager)
    }
    
    override func tearDown() {
        super.tearDown()
        
        let realm = try! realmManager.getRealmInstance()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    // MARK: - Tests
    
    func test_fetchSessions_itCreatesTheProperDisplayableSessions() throws {
        // Arrange
        try! populateMockRealm()
        var expected = [StoredSession]()
        for i in 0..<5 {
            expected.append(StoredSession(title: "\(i)"))
        }
        
        // Act
        fetchResolver.fetchSessions { (result) in
            // Assert
            switch result {
            case .success(let displayableSessions):
                guard let actual = displayableSessions as? [StoredSession] else {
                    XCTFail("fetchResolver.fetchSessions succeeded but returned result that wasn't [StoredSession]")
                    return
                }
                XCTAssertEqual(actual, expected)
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "test_fetchSessions_itCreatesTheProperDisplayableSessions failed")
            }
        }
    }
    
    // MARK: - Private helpers
    
    func populateMockRealm() throws {
        let realm = try realmManager.getRealmInstance()
        realm.beginWrite()
        for i in 0..<5 {
            // Add row via dictionary. Order is ignored.
            realm.create(StoredSession.self, value: ["title": "\(i)"])
        }
        try! realm.commitWrite()
    }
    
}
