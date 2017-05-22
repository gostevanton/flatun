//
//  ProvidersInteractor.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class SplashInteractor: SplashInteractorInterface {
    
    var dataMager: DataManager!
    var presenter: SplashPresenterInterface!
    
    required init() {
        dataMager = DataManager.shared
    }
    
    func initProviders() {
        dataMager.loadProviders { (providers, error) in
            if providers == nil {
                self.presenter.showError()
            } else {
                self.presenter.presentPostView()
            }
        }
    }
}
