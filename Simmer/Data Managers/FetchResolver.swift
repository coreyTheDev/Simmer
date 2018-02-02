//
//  FetchResolver.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation

protocol FetchResolver {
    func fetchSessions(completion: ((_: FetchResult)->Void))
}
