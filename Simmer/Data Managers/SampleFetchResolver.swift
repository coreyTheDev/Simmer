//
//  SampleFetchResolver.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation

//TODO: This will implement the SessionFetcher protocol to populate the initial sections

struct SampleFetchResolver: FetchResolver {
    
    func fetchSessions(completion: ((FetchResult) -> Void)) {
        completion(FetchResult.success([DisplayableSession(title: "Test")]))
    }
    
}
