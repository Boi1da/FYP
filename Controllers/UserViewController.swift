//
//  UserViewController.swift
//  FYP
//
//  Created by Armani on 31/01/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userTableView.delegate = self
        userTableView.dataSource = self
    }
}

extension UserViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        let tableViewResults = userCells[indexPath.row]
        
        cell.userImage.image = tableViewResults["userImage"] as? UIImage
        cell.userNameLabel.text = tableViewResults["userName"] as? String
        cell.lastCommitLabel.text = tableViewResults["date"] as? String
        
        cell.userImage.layer.cornerRadius = cell.userImage.frame.height / 2
        cell.userImage.clipsToBounds = true
        return cell
    }
}
