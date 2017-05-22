//
//  Image.swift
//  SocialNets
//
//  Created by Антон Гостев on 19.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class Image: NSObject {
    
    var image: URL
    
    var height: Int
    var width: Int

    //"color":"#040404"
    var color: String
    
    init(_ image: URL, _  height: Int, _ width: Int, _ color: String) {
        self.image = image
        self.height = height
        self.width = width
        self.color = color
    }

}
