//
//  PostInteractorInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

protocol PostsInteractorInterface: class {
    
    var dataMager: DataManager! { set get }
    var presenter: PostsPresenterInterface! { set get }

    init()
    
    func getPosts(_ providerId: Int?,  _ author: String?)
    
    func getPostsForPage(_ providerId: Int?, _ page: Int,  _ author: String?)
    
    func updatePosts(_ providerId: Int?)
}
