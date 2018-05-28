//
//  CommitsViewController.swift
//  FYP
//
//  Created by Armani on 31/01/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit

class CommitsViewController: UIViewController {
    
    @IBOutlet weak var commitsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commitsTableView.delegate = self
        commitsTableView.dataSource = self
    }
}

extension CommitsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultsTableViewCell
        let tableViewResults = resultCells[indexPath.row]
        
        cell.arrowImageView.image = tableViewResults["arrowImage"] as? UIImage
        cell.contributerName.text = tableViewResults["userName"] as? String
        cell.contributionDate.text = tableViewResults["date"] as? String
        cell.technicalDebtCost.text = tableViewResults["technicalDebtCost"] as? String
        return cell
    }
}
