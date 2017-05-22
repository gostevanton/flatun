//
//  ProvidersPresenter.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

class ProvidersPresenter: ProvidersPresenterInterface {
    
    weak var view: ProvidersViewInterface!
    var interactor: ProvidersInteractorInterface!
    var wireframe: ProvidersWireframeInterface!
    
    func getProviders() {
        interactor.getProviders()
    }

    func showProviders(_ providers: [Provider]) {
        view.showProviders(providers)
    }

    func showPostsFor(provider: Provider?) {
        wireframe.presentPostsFor(provider)
    }
}
