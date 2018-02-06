//
//  RealmFetchResolver.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/6/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmFetchResolver: FetchResolver {
    
    func fetchSessions(completion: ((FetchResult) -> Void)) {
        
        do {
            let realm = try Realm()
            let storedSessions = realm.objects(StoredSession.self)
            var displayableSessions = [DisplayableSession]()
            for storedSession in storedSessions {
                guard let displayableSession = storedSession.createDisplayableSession() else {
                    continue
                }
                displayableSessions.append(displayableSession)
            }
            
            completion(.success(displayableSessions))
        } catch let error {
            completion(FetchResult.failure(error))
        }
    }
    
    
}
