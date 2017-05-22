//
//  PostsWireframe.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class PostsWireframe: PostsWireframeInterface {
    
    var root: RootWireframeInterface?
    let presenter: PostsPresenter!

    required init(root: RootWireframeInterface?, view: PostsViewInterface) {
        self.root = root

        let interactor = PostsInteractor()
        presenter = PostsPresenter()
    
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = self
    }
    
    func attachRoot(with controller: UIViewController, in window: UIWindow) {
        root?.showRoot(with: controller, in: window, navBarHidden: false)
    }
    
    func presentVC(with controller: UIViewController) {
        root?.presentVC(with: controller)
    }
    
    func popViewController() {
        root?.popViewController()
    }
    
    func toggleMenu() {
        root?.toggleMenu(with: presenter.view as! UIViewController)
    }
    
    func presentSubPosts(for provider: Provider?, with author: String) {
        let vc = PostsWireframe.createViewController()
        let postsWireframe = PostsWireframe(root: root, view: vc as PostsViewInterface)
        
        postsWireframe.presenter.author = author
        postsWireframe.presenter.provider = provider
        
        postsWireframe.presentVC(with: vc)
    }
    
    static func createViewController() -> PostsViewController {
        let sb = UIStoryboard(name: "Posts", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PostsViewController")
        return vc as! PostsViewController
    }
}
