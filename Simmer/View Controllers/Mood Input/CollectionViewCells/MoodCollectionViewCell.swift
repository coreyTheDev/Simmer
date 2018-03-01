//
//  MoodCollectionViewCell.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/14/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import UIKit

class MoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return moodLabel.sizeThatFits(size)
    }

}
