//
//  RepositoryTableViewController.swift
//  FYP
//
//  Created by Armani on 15/01/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit

class RepositoryTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var repoArray = [Repository]()
    var emptyImage = UIImage()
    var tempName: String?
    
    //By default search for Java
    var searchBarText = "Java"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchBar.delegate = self
        
        performSelector(inBackground: #selector(fetchRepositories), with: nil)
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.16, green:0.15, blue:0.17, alpha:1.00)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isOpaque = false
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 50)]
    }
    
    //Push all work into background thread so main thread doesnt kill app off
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCells") as! RepoTableViewCell
        let repo = repoArray[indexPath.row]
    
        cell.repoDescription.text = repo.repoDescription
        cell.RepoTitle.text = repo.repoTitle
        cell.RepoNameLabel.text = repo.repoName
        cell.userImageView.image = repo.avatarImage
        return cell
    }
    
    // Convert URL to image
    func getImageFromURL(urlToSearch : String) -> UIImage {
        var image : UIImage
        let url = URL(string: urlToSearch)
        if let data = try? Data(contentsOf: url!) {
            image = UIImage(data: data)!
            return image
        }
        return emptyImage
    }
    
    @objc func fetchRepositories(searchBarResult: String) {
        if let data = try? Data(contentsOf: URL(string: "https://api.github.com/search/repositories?q=\(searchBarResult)&sort=stars&order=desc")!){
            let jsonSearchResults = JSON(data: data)
            DispatchQueue.main.async { [unowned self ] in
                self.repoArray.removeAll()
                self.parseJSON(json: jsonSearchResults)
                self.tableView.reloadData()
            }
        }
    }
    
    func parseJSON(json: JSON){
        for result in json["items"].arrayValue {
            let repoName = result["name"].stringValue
            let repoTitle = result["fullName"].stringValue
            let repoDescription = result["description"].stringValue
            let avatarImage = getImageFromURL(urlToSearch: result["owner"]["avatar_url"].stringValue)
            
            let repo = Repository(repoName: repoName, repoTitle: repoTitle, repoDescription: repoDescription, avatarImage: avatarImage)
        
            repoArray.append(repo)
            //print("\(repo.repoName) + \(repoArray.count) ")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCells") as! RepoTableViewCell
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "results") as? ResultsViewController {
            let repo = repoArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoArray.count
    }
}

//Perform search for 30 new repositories based on search bar
extension RepositoryTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text != nil) {
            print(searchBar.text)
            fetchRepositories(searchBarResult: searchBar.text!)
        }
    }
}
