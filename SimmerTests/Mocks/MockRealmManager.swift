//
//  MockRealmManager.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/6/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

@testable import Simmer
import RealmSwift

final class MockRealmManager: RealmManager {
    
    private let realmInMemoryIdentifier = "TestInMemoryRealmDatabase"
    private var mockSessions: [StoredSession]?
    
    init() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = realmInMemoryIdentifier
    }
    
    func getRealmInstance() throws -> Realm {
        do {
            return try Realm()
        } catch let error {
            throw error
        }
    }
}
