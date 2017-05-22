//
//  Provider.swift
//  SocialNets
//
//  Created by Антон Гостев on 19.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class Provider: NSObject {
    var id: Int

    var name: String

    var image: URL
    
    var lastFeedItem: Int
    
    init(_ id: Int,_  name: String,_ image: URL, _ lastFeedItem: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.lastFeedItem = lastFeedItem
    }

}
