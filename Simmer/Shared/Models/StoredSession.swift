//
//  StoredSession.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import RealmSwift

class StoredSession: Object, DisplayableSession {
    
    @objc dynamic var title = "Session Title"
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
    
    // Note: because Object inherits from NSObject and NSObject implements the Equatable protocol through isEqual(_:) we need to override this function to test for equivalency
    override func isEqual(_ object: Any?) -> Bool {
        guard let objectAsStoredSession = object as? StoredSession else {
            return false
        }
        
        return self.title == objectAsStoredSession.title
    }
    
}
