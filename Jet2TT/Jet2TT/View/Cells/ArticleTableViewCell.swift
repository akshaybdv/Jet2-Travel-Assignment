//
//  ArticleTableViewCell.swift
//  Jet2TT
//
//  Created by Badve, Akshay on 6/21/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var userDesignationLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var articleNameLabel: UILabel!
    @IBOutlet weak var articleUrlLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    /// Function to setup cell
    /// - Parameters:
    ///   - indexPath: indexpath instance
    ///   - articleObjects: article object array
    func setArticlesOnCellAt(indexPath: IndexPath, articleObjects: [Article]) {
        
        articleNameLabel.text = articleObjects[indexPath.row].media.first?.title
        articleUrlLabel.text = articleObjects[indexPath.row].media.first?.url
        commentsLabel.text = articleObjects[indexPath.row].comments.roundedWithAbbreviations + Constants.Strings.comments
        likesLabel.text = articleObjects[indexPath.row].likes.roundedWithAbbreviations + Constants.Strings.likes
        userNameLabel.text = articleObjects[indexPath.row].user.first?.name
        userDesignationLabel.text = articleObjects[indexPath.row].user.first?.designation
        contentLabel.text = articleObjects[indexPath.row].content
        timeLabel.text = articleObjects[indexPath.row].createdAt.toDate()?.timeAgoSinceDate()
        userImageView.loadImageFromServer(url: articleObjects[indexPath.row].user.first?.avatar ?? Constants.Strings.emptyString)
        articleImageView.loadImageFromServer(url: articleObjects[indexPath.row].media.first?.image ?? Constants.Strings.emptyString)
    }
}

