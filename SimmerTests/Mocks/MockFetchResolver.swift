//
//  MockFetchResolver.swift
//  SimmerTests
//
//  Created by Corey Zanotti on 2/2/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
@testable import Simmer

struct MockFetchResolver: FetchResolver {
    
    var result: FetchResult = .success([DisplayableSession(title: "Test")])
    func fetchSessions(completion: ((FetchResult) -> Void)) {
        completion(result)
    }
    
}
