//
//  Post.swift
//  SocialNets
//
//  Created by Антон Гостев on 19.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//
import UIKit

class Post: NSObject {
    
    var id : Int
    
    //    наименование новости
    var title : String
    
    //    дата публикации
    var published : Date?
    
    //    картинку(jpeg, png, gif)
    var images : [Image]
 
    //    количество лайков
    var likesCount : Int

    
    var viewsCount : Int
    var boardsCount : Int
    
    
    //    источник (лого и название)
    var providerAuthorName : String
    var providerAuthorAvatar : URL?

    init(id : Int, title : String, published : Date?, images : [Image], likesCount : Int, viewsCount : Int, boardsCount : Int, providerAuthorName : String, providerAuthorAvatar : URL?) {
        
        self.id = id
        self.title = title
        self.published = published
        self.images = images
        self.likesCount = likesCount
        self.viewsCount = viewsCount
        self.boardsCount = boardsCount
        self.providerAuthorName = providerAuthorName
        self.providerAuthorAvatar = providerAuthorAvatar
    }
    


}
