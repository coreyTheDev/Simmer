//
//  RealmManager.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/6/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import RealmSwift

protocol RealmManager {
    func getRealmInstance() throws -> Realm
}

struct ApplicationDirectoryRealmManager: RealmManager {
    func getRealmInstance() throws -> Realm {
        do {
            return try Realm()
        } catch let error {
            throw error
        }
    }
}
