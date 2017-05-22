//
//  MenuItemTableViewCell.swift
//  SocialNets
//
//  Created by Антон Гостев on 20.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class ProviderTableViewCell: UITableViewCell {
    
@IBOutlet weak var providerImageView: UIImageView!
@IBOutlet weak var providerNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        providerImageView.layer.cornerRadius = providerImageView.bounds.size.width / 2
        providerImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
