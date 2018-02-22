//
//  SessionComposerViewController.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/13/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import UIKit

class SessionComposerViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let moods: [String] = [
        "Short",
        "Longer",
        "Longer still",
        "Getting even longer still",
        "Hopefully this is a multiple line mood",
        "If not this is more than likely a multiple line mood",
        "If not this definitely is probably possibly a very long, multiple line mood"
    ]
    private let sizer = MoodCellSizer()
    private var keyboardNotificationHandler: KeyboardNotificationHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        registerForNotifications()
    }
    
    // MARK: - Configuration
    
    func configureCollectionView() {
        collectionView.register(MoodCollectionViewCell.nib, forCellWithReuseIdentifier: MoodCollectionViewCell.nibName)
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "SpacingCell")
        collectionView.register(MoodEntryCollectionViewCell.nib, forCellWithReuseIdentifier: MoodEntryCollectionViewCell.nibName)
    }
    
    func registerForNotifications() {
        keyboardNotificationHandler = KeyboardNotificationHandler(scrollView: collectionView)
        keyboardNotificationHandler?.delegate = self
    }
    
}

extension SessionComposerViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return moods.count
        case 1:
            return 20
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let moodCell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCollectionViewCell.nibName, for: indexPath) as! MoodCollectionViewCell
            moodCell.moodLabel.text = moods[indexPath.item]
            return moodCell
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "SpacingCell", for: indexPath)
        case 2:
            return collectionView.dequeueReusableCell(withReuseIdentifier: MoodEntryCollectionViewCell.nibName, for: indexPath)
        default:
            return UICollectionViewCell()
        }
        
    }
    
}

extension SessionComposerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let cellSize = sizer.cellSize(maxWidth: collectionView.frame.width, moodString: moods[indexPath.item])
            return cellSize
        default:
            return CGSize(width: collectionView.frame.width, height: 50)
        }
    }
    
}

extension SessionComposerViewController: KeyboardNotificationHandlerDelegate {
    
    func keyboardDidShow(_ notificationHandler: KeyboardNotificationHandler) {
        // TODO: Add test for scrolling text field to visible
    }
    
    func keyboardWillHide(_ notificationHandler: KeyboardNotificationHandler) {
        //TODO: I don't think I need to do anything here
    }
    
}
