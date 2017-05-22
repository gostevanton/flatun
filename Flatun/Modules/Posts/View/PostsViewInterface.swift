//
//  File.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

protocol PostsViewInterface: class {
    
    var controller: UIViewController? { get }
    var presenter: PostsPresenterInterface! { set get }
    
    func showPosts(_ posts: [Post], _ totalCount: Int)
    
    func addPostFromNextPage(_ posts: [Post])
    
    func setCurrentTitle(_ title: String)
}
