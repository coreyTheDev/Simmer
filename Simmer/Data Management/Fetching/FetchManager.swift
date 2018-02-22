//
//  FetchManager.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation

protocol FetchManagerDelegate: class {
    func fetchCompleted(with result: FetchResult)
}

class FetchManager {
    
    weak var delegate: FetchManagerDelegate?
    private let resolver: FetchResolver
    
    init(resolver: FetchResolver = SampleFetchResolver()) {
        self.resolver = resolver
    }
    
    func fetchSessions() {
        resolver.fetchSessions { (result) in
            delegate?.fetchCompleted(with: result)
        }
    }
    
}
