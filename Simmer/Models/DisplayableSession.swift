//
//  DisplayableSession.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/6/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation

protocol SessionDisplayable {
    func createDisplayableSession() -> DisplayableSession?
}

struct DisplayableSession {
    let title: String
}

extension DisplayableSession: Equatable {
    static func ==(lhs: DisplayableSession, rhs: DisplayableSession) -> Bool {
        return lhs.title == rhs.title
    }
}
