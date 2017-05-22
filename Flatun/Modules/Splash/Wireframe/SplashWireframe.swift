//
//  SplashWireframe.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class SplashWireframe: SplashWireframeInterface {
    
    var root: RootWireframeInterface?
    var window: UIWindow!
    
    required init(root: RootWireframeInterface?, view: SplashViewController) {
        self.root = root
        
        let presenter = SplashPresenter()
        let interactor = SplashInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = self
    }
    
    func attachRoot(with controller: UIViewController, in window: UIWindow) {
        root?.showRoot(with: controller, in: window)
    }
    
    func presentPostView() {
        let vc = PostsWireframe.createViewController()
        let postsWireframe = PostsWireframe(root: root, view: vc as PostsViewInterface)
        postsWireframe.attachRoot(with: vc, in: window!)
    }
    
    func showErrorAlert(title: String, message: String, from controller: UIViewController?) {
        guard controller != nil else {
            return
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        controller!.present(alert, animated: true, completion: nil)
    }
    
    
    static func createViewController() -> SplashViewController {
        let sb = UIStoryboard(name: "Splash", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SplashViewController")
        return vc as! SplashViewController
    }
}

