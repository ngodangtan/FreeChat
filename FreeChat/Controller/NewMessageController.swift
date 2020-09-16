//
//  NewMessageController.swift
//  FreeChat
//
//  Created by Ngo Dang tan on 9/16/20.
//  Copyright © 2020 Ngo Dang Tan. All rights reserved.
//

import UIKit
private let reuseIdentifier = "UserCell"
class NewMessageController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
    }
    // MARK: - Selectors
    @objc func handleDismissal(){
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - API
    func fetchUsers(){
        Service.fetchUsers()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        configureNavigationBar(withTitle: "New Message", prefersLargeTitles: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
        
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
        
    }
}
    // MARK: - UITableViewDataSource
extension NewMessageController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell

        return cell
    }
}
