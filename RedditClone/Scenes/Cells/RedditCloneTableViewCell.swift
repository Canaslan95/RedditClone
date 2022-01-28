//
//  RedditCloneTableViewCell.swift
//  RedditClone
//
//  Created by Oğulcan Aslan on 27.01.2022.
//

import UIKit
import Kingfisher

class RedditCloneTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var redditImageView: UIImageView!
    @IBOutlet private weak var redditTextLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var redditImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var redditImageViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = .secondarySystemBackground
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        redditTextLabel.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    func populate(viewModel: ChildData) {
        
        titleLabel.text = viewModel.title
        redditTextLabel.text = viewModel.name
        
        if let thumbnail = viewModel.thumbnail, thumbnail != "self" {
            redditImageViewWidthConstraint.constant = CGFloat(viewModel.thumbnailWidth ?? 0)
            redditImageViewHeightConstraint.constant = CGFloat(viewModel.thumbnailHeight ?? 0)
            let imageUrl = URL(string: thumbnail)
            redditImageView.kf.setImage(with: imageUrl)
        } else {
            redditImageView.image = UIImage(named: "error404")
            redditImageViewWidthConstraint.constant = 100
            redditImageViewHeightConstraint.constant = 100
        }
    }
}
