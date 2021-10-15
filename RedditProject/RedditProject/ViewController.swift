//
//  ViewController.swift
//  RedditProject
//
//  Created by Yevgeniy Ivanov on 10/14/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    var displayInfo: [TopDataChild] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.text = ""
        
        let nib = UINib(nibName: "CellView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
    }
    
    func addTopCountToDisplay(results: [TopDataChild], count: Int) {
        for (i, result) in results.enumerated() {
            displayInfo.append(result)
            if i == count - 1 { break }
        }
        
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
    func fetchInfoBySubredditName(_ name: String) {
        displayInfo = []
        tableView.reloadData()
        ViewModel.fetch(subName: name) { res in
            if let allResults = try? res.get() {
                self.addTopCountToDisplay(results: allResults, count: 20)
            }
        }
    }
    

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        displayInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        cell.titleLabel.text = displayInfo[indexPath.row].data.title
        cell.subredditLabel.text = "r/\(displayInfo[indexPath.row].data.subreddit)"
        cell.scoreLabel.text = "Rating: \(displayInfo[indexPath.row].data.score)"
        
        return cell
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        spinner.showIn(view)
        let text = searchBar.text!
        fetchInfoBySubredditName(text)
    }
}

extension UIActivityIndicatorView {
    func showIn(_ view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startAnimating()
    }
}
