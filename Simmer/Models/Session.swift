//
//  Session.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import RealmSwift

protocol SessionDisplayable {
    func createDisplayableSession() -> DisplayableSession?
}

struct DisplayableSession {
    let title: String
}

class StoredSession: Object {
    @objc dynamic var title = "Session Title"
}

extension StoredSession: SessionDisplayable {
    func createDisplayableSession() -> DisplayableSession? {
        return DisplayableSession(title: self.title)
    }
}
