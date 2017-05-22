//
//  PostTableViewCell.swift
//  SocialNets
//
//  Created by Антон Гостев on 20.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameButton: UIButton!
    
    @IBOutlet weak var likesCountLabel : UILabel!
    @IBOutlet weak var viewsCountLabel : UILabel!
    @IBOutlet weak var boardsCountLabel : UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
        
        authorImageView.layer.cornerRadius = authorImageView.bounds.size.width / 2
        authorImageView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
