//
//  FetchResult.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/31/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation

enum FetchResult {
    case success([DisplayableSession])
    case failure(Error?)
}
