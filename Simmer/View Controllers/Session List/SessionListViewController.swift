//
//  SessionListViewController.swift
//  Simmer
//
//  Created by Corey Zanotti on 1/26/18.
//  Copyright © 2018 Corey Zanotti. All rights reserved.
//

import UIKit

protocol SessionListViewControllerDelegate: class {
    func sessionListViewControllerDidSelectNewSession(sessionListViewController: SessionListViewController)
}

class SessionListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: SessionListViewControllerDelegate?
    private var sessions: [DisplayableSession]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        fetchSessions()
    }

    // MARK: - Configuration
    
    func configureNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newSessionButtonPressed(_:)))
        navigationItem.title =  NSLocalizedString("Sessions", comment: "The title for the Sessions landing view")
    }
    
    // MARK: - Data handling
    
    private func fetchSessions() {
        let fetchManager = FetchManager(resolver: RealmFetchResolver())
        fetchManager.delegate = self
        fetchManager.fetchSessions()
    }
    
    // MARK: - Action Handling
    
    @objc func newSessionButtonPressed(_ sender: Any) {
        delegate?.sessionListViewControllerDidSelectNewSession(sessionListViewController: self)
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
        
        //TODO: Create cell subclass or re-register a basic cell
        let titleSubtitleCell = tableView.dequeueReusableCell(withIdentifier: "titleSubtitleCell", for: indexPath)
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
