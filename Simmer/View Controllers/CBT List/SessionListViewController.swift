//
//  SessionListViewController.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/26/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    struct SegueIdentifiers {
        static let segueToComposer = "SegueToComposer"
    }
    struct CellIdentifiers {
        static let titleSubtitleCell = "TitleSubtitleCell"
    }
}

class SessionListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var sessions: [DisplayableSession]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSessions()
    }

    // MARK: - Configuration
    
    private func fetchSessions() {
        let fetchManager = FetchManager(resolver: RealmFetchResolver())
        fetchManager.delegate = self
        fetchManager.fetchSessions()
    }
    
    // MARK: - Action Handling
    
    @IBAction func newSessionButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: Constants.SegueIdentifiers.segueToComposer, sender: self)
    }
    
}

extension SessionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sessions = sessions else {
            fatalError("Can't dequeue cell: There are no sessions to display.")
        }
        
        let titleSubtitleCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.titleSubtitleCell, for: indexPath)
        titleSubtitleCell.configure(with: sessions[indexPath.row])
        return titleSubtitleCell
    }
    
}

extension SessionListViewController: FetchManagerDelegate {
    
    func fetchCompleted(with result: FetchResult) {
        switch result {
        case .success(let sessions):
            self.sessions = sessions
            tableView.reloadData()
        case .failure(let error):
            print("Fetch failed with \(error?.localizedDescription ?? "")")
        }
    }
    
}
