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
    
    private let realmManager: RealmManager
    
    init(realmManager: RealmManager = ApplicationDirectoryRealmManager()) {
        self.realmManager = realmManager
    }
    
    func fetchSessions(completion: ((FetchResult) -> Void)) {
        do {
            // we want to test that when an error is caught it throws the error
            let realm = try realmManager.getRealmInstance()
            let storedSessions = realm.objects(StoredSession.self)
            
            // we want to test that the displayableSessions it returns are all that we expect
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
