//
//  MoodInputViewController.swift
//  Simmer
//
//  Created by Corey Zanotti on 2/13/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import UIKit

fileprivate var moods: [String] = [
    "Short",
    "Longer",
    "Longer still",
    "Getting even longer still",
    "Hopefully this is a multiple line mood",
    "If not this is more than likely a multiple line mood",
    "If not this definitely is probably possibly a very long, multiple line mood"
]

protocol MoodInputViewControllerDelegate: class {
    func moodInputViewController(moodInputViewController: MoodInputViewController, didFinishWith moods: [String])
    func moodInputViewControllerDidCancel(moodInputViewController: MoodInputViewController)
}

class MoodInputViewController: UIViewController {

    var delegate: MoodInputViewControllerDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sizer = MoodCellSizer()
    private var keyboardNotificationHandler: KeyboardNotificationHandler?
    private weak var moodEntryTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureCollectionView()
        registerForNotifications()
    }
    
    // MARK: - Configuration
    
    func configureNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed(sender:)))
        navigationItem.title =  NSLocalizedString("Mood", comment: "The title for the mood input view contorller")
        navigationItem.prompt = NSLocalizedString("Enter what emotions are coming up for you because of this situation.", comment: "Prompt telling users to write out the emotions that are coming up for them.")
    }
    
    func configureCollectionView() {
        collectionView.contentInset = UIEdgeInsetsMake(15, 15, 15, 15)
        
        collectionView.register(MoodCollectionViewCell.nib, forCellWithReuseIdentifier: MoodCollectionViewCell.nibName)
        collectionView.register(MoodEntryCollectionViewCell.nib, forCellWithReuseIdentifier: MoodEntryCollectionViewCell.nibName)
    }
    
    func registerForNotifications() {
        keyboardNotificationHandler = KeyboardNotificationHandler(scrollView: collectionView)
        keyboardNotificationHandler?.delegate = self
    }
    
    // MARK: - Action handling
    
    @objc func cancelPressed(sender: UIBarButtonItem) {
        print("delegate = \(self.delegate)")
        self.delegate?.moodInputViewControllerDidCancel(moodInputViewController: self)
    }
    
}

extension MoodInputViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return moods.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 1:
            let moodCell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCollectionViewCell.nibName, for: indexPath) as! MoodCollectionViewCell
            moodCell.moodLabel.text = moods[indexPath.item]
            return moodCell
        case 0:
            let moodEntryCell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodEntryCollectionViewCell.nibName, for: indexPath) as! MoodEntryCollectionViewCell
            moodEntryCell.moodEntryTextField.delegate = self
            return moodEntryCell
        default:
            return UICollectionViewCell()
        }
        
    }
    
}

extension MoodInputViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 1:
            let cellSize = sizer.cellSize(maxWidth: collectionView.displayableWidth(), moodString: moods[indexPath.item])
            return cellSize
        default:
            return CGSize(width: collectionView.displayableWidth(), height: 50)
        }
    }
    
}

extension MoodInputViewController: KeyboardNotificationHandlerDelegate {
    
    func keyboardDidShow(_ notificationHandler: KeyboardNotificationHandler) {
        // TODO: Add test for scrolling text field to visible
    }
    
    func keyboardWillHide(_ notificationHandler: KeyboardNotificationHandler) {
        //TODO: I don't think I need to do anything here
    }
    
}

extension MoodInputViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moodEntryTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let newMoodText = textField.text, !newMoodText.isEmpty else {
            return false
        }
        
        textField.text = nil
        
        collectionView.performBatchUpdates({
            moods.insert(newMoodText, at: 0)
            collectionView.insertItems(at: [IndexPath(row: 0, section: 1)])
        }, completion: nil)
        
        return false
    }
    
}
