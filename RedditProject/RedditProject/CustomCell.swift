//
//  CellViewController.swift
//  RedditProject
//
//  Created by Yevgeniy Ivanov on 10/14/21.
//

import UIKit

class CustomCell : UITableViewCell {
    
    @IBOutlet weak var subredditLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var subTitle: String = ""
    var subreddit: String = ""
    var score: Double = 0.0
    
    
}

