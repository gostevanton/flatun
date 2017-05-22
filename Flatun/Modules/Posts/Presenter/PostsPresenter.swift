//
//  PostsPresenter.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

class PostsPresenter: PostsPresenterInterface {
    
    weak var view: PostsViewInterface!
    var interactor: PostsInteractorInterface!
    var wireframe: PostsWireframeInterface!

    var provider : Provider?
    var author : String?
    
    func getPosts() {
        
        if let author = author {
            view.setCurrentTitle(author)
        } else {
            if let provider = provider {
                view.setCurrentTitle(provider.name)
            } else {
                view.setCurrentTitle("All feed")
            }
        }

        interactor.getPosts(provider?.id, author)
    }
    
    func getPostsFor(_ page: Int) {
        interactor.getPostsForPage(provider?.id, page, author)
    }
    
    func showPosts(_ posts: [Post],_ totalCount: Int) {
        view?.showPosts(posts, totalCount)
    }
    
    func addPostFromNextPage(_ posts: [Post]) {
        view?.addPostFromNextPage(posts)
    }
    
    func updatePosts() {
        interactor.updatePosts(provider?.id)
    }

    func popViewController() {
        wireframe.popViewController()
    }
    
    func toggleMenu() {
        wireframe.toggleMenu()
    }
    
    func presentSubPosts(with author: String) {
        if self.author != author {
            
            if author.characters.count > 0 {
                wireframe.presentSubPosts(for: provider, with: author)
            }
        }
    }

}
