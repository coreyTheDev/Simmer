//
//  SampleFetchResolver.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation

struct SampleFetchResolver: FetchResolver {
    
    func fetchSessions(completion: ((FetchResult) -> Void)) {
        completion(FetchResult.success([StoredSession(title: "Test")]))
    }
    
}
