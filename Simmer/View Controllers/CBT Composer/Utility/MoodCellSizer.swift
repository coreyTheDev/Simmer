//
//  MoodCellSizer.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/15/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import Foundation
import CoreGraphics

struct MoodCellSizer {
    
    private let measuringCell: MoodCollectionViewCell = .create()
    
    func cellSize(maxWidth: CGFloat, moodString: String) -> CGSize {
        measuringCell.moodLabel.text = moodString
        return measuringCell.sizeThatFits(CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
    }
    
}
