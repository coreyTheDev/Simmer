//
//  StoredSession.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import RealmSwift

class StoredSession: Object {
    @objc dynamic var title = "Session Title"
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

extension StoredSession: SessionDisplayable {
    func createDisplayableSession() -> DisplayableSession? {
        return DisplayableSession(title: self.title)
    }
}
