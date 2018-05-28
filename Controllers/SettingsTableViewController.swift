//
//  SettingsTableViewController.swift
//  FYP
//
//  Created by Armani on 17/04/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    //Need to finish!

    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 3
    }

  
}
