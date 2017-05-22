//
//  PostsInteractor.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

class PostsInteractor: PostsInteractorInterface {
    
    var dataMager: DataManager!
    var presenter: PostsPresenterInterface!
    
    required init() {
       dataMager = DataManager.shared
    }
    
    func getPosts(_ providerId: Int?,  _ author: String?) {
        
        dataMager.loadData(providerId, nil) { (posts, totalCount, error) in
            
            if let posts = posts {
                self.presenter.showPosts(self.sortPost(posts, with: author), totalCount!)
            }
        }
    }
    
    func getPostsForPage(_ providerId: Int?, _ page: Int,_ author: String?) {
        
        dataMager.loadData(providerId, page) { (posts, totalCount, error) in
            
            if let posts = posts {
                self.presenter.addPostFromNextPage(self.sortPost(posts, with: author))
            }
        }
    }
    
    func sortPost(_ posts: [Post], with author: String?) -> [Post]{
        
        if let author = author {
            
            var sortedPosts = [Post]()
            
            for post in posts {
                if post.providerAuthorName == author {
                    sortedPosts.append(post)
                }
            }
            
            return sortedPosts
        }
        
        return posts
    }
    
    func updatePosts(_ providerId: Int?) {
        
        if providerId == nil {
            getPosts(nil, nil)
            return
        }
            
        var lastPost = 0
        
        for provider in dataMager.providers {
            if provider.id == providerId! {
                lastPost = provider.lastFeedItem
            }
        }
        
        dataMager.loadProviders({ (providers, error) in
            if let providers = providers {
                
                if let provider = self.providersIn(providers, with: providerId!) {
                    
                    if provider.lastFeedItem > lastPost {
                        
                        self.getPosts(providerId, nil)

                    }
                }
            }
        })
    }
    
    func providersIn(_ providers: [Provider], with id: Int) -> Provider? {
        
        for provider in providers {
            if provider.id == id {
                return provider
            }
        }

        return nil
    }
}
