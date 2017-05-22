//
//  PostPresenterInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

protocol PostsPresenterInterface: class {
    
    var view: PostsViewInterface! { set get }
    var interactor: PostsInteractorInterface! { set get }
    var wireframe: PostsWireframeInterface! { set get }
    
    var provider : Provider? { set get }
    var author : String? { set get }
    
    func getPosts()
    
    func getPostsFor(_ page: Int)
    
    func showPosts(_ posts: [Post],_ totalCount: Int)
    
    func addPostFromNextPage(_ posts: [Post])
    
    func updatePosts()
    
    func popViewController()
    
    func toggleMenu()
    
    func presentSubPosts(with author: String)
}
