//
//  DataManager.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit
import Alamofire

class DataManager: NSObject {
    
    static let shared = DataManager()
    
    let feedBaseUrl = "http://www.flatun.com/api/feed_item/"
    let providersBaseUrl = "http://www.flatun.com/api/provider/"
    
    var providers = [Provider]()
    
    
    private override init() {
    }
    
    
    func loadData(_ providerId: Int?, _ page: Int?, _ callback: @escaping ([Post]?, Int?, Error?) -> Void) {
        
        var parameters: Parameters? = Parameters()
            
        if let providerId = providerId {
            parameters!.updateValue(providerId, forKey: "provider")
        }
        
        if let page = page {
            parameters!.updateValue(page, forKey: "page")
        }
            
        if parameters!.count == 0 {
            parameters = nil
        }
        
        Alamofire.request(feedBaseUrl, method: .get, parameters: parameters).responseJSON { response in
            
            if let JSON = response.result.value {
                
                let response = JSON as! Dictionary<String, Any>
                
                let results = response["results"] as! Array<Dictionary<String, Any>>
                
                let totalPosts = response["count"] as! Int
                
                callback(self.parsePosts(dics: results),totalPosts,  nil)
                
            } else {
                
                callback(nil, nil, response.error)
            }
        }
    }
    
    func loadProviders(_ callback: @escaping ([Provider]?, Error?) -> Void) {
        
        Alamofire.request(providersBaseUrl, method: .get).responseJSON { response in
            
            if let JSON = response.result.value {
                
                let response = JSON as! Array<Dictionary<String, Any>>
                
                let providers = self.parseProviders(dictionary: response)
                
                self.providers = providers
                 
                callback(providers,  nil)
                
            } else {
                
                callback(nil, response.error)
            }
        }
    }
    
    //MARK: Parse Methods
    
    func parsePosts(dics: Array<Dictionary<String, Any>>) -> [Post] {
        
        var tempPosts = [Post]()
        
        for dic in dics {
            
            let id = dic["id"] as! Int
            let title = dic["title"] as! String
            let published = dic["published"] as! String
            let images = self.parseImages(dictionary: (dic["images"] as! Array<Dictionary<String, Any>>))
            let likesCount = dic["likes_count"] as! Int
            let viewsCount = dic["views_count"] as! Int
            let boardsCount = dic["boards_count"] as! Int
            let providerAuthorName = dic["provider_author_name"] as! String
            
            
            var providerAuthorAvatar : URL?
            
            if dic["provider_author_avatar"] is NSNull {
                providerAuthorAvatar = nil
            } else {
                providerAuthorAvatar = URL(string:(dic["provider_author_avatar"] as! String))!
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            
            tempPosts.append(Post(id: id,
                                   title: title,
                                   published: dateFormatter.date(from: published),
                                   images: images,
                                   likesCount: likesCount,
                                   viewsCount: viewsCount,
                                   boardsCount: boardsCount,
                                   providerAuthorName: providerAuthorName,
                                   providerAuthorAvatar: providerAuthorAvatar))
            
            
        }
        
        return tempPosts
    }
    
    func parseImages(dictionary: Array<Dictionary<String, Any>>) -> [Image] {
        
        var tempImages = [Image]()
        
        for dic in dictionary {
            
            let image = URL(string:(dic["image"] as? String)!)!
            
            let height = dic["height"] as! Int
            let width = dic["width"] as! Int
            let color = dic["color"] as! String
            
            tempImages.append(Image(image, height, width, color))
        }
        return tempImages
    }
    
    func parseProviders(dictionary: Array<Dictionary<String, Any>>) -> [Provider] {
        
        var tempProviders = [Provider]()
        
        for dic in dictionary {
            
            let id = dic["id"] as! Int
            let name = dic["name"] as! String
            let image = dic["image"] as! String
            let lastFeedItem = dic["last_feed_item"] as! Int
            
            tempProviders.append(Provider(id, name, URL(string:image)!, lastFeedItem))
            
        }
        return tempProviders
    }
}
