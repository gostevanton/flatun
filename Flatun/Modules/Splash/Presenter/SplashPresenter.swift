//
//  SplashPresenter.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

class SplashPresenter: SplashPresenterInterface {
    
    weak var view: SplashViewInterface!
    var wireframe: SplashWireframeInterface!
    var interactor: SplashInteractorInterface!
    
    
    func initData() {
        view.setRefreshHidden(true)
        interactor.initProviders()
    }
    
    func presentPostView() {
        sleep(1)
        wireframe.presentPostView()
    }
    
    func showError() {
        view.setRefreshHidden(false)
        wireframe.showErrorAlert(title: "Ошибка", message: "Проверьте соединение", from: view.controller)
    }
}
