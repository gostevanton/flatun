//
//  ProvidersInteractor.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class ProvidersInteractor: ProvidersInteractorInterface {
    
    var dataMager: DataManager!
    var presenter: ProvidersPresenterInterface!
    
    required init() {
        dataMager = DataManager.shared
    }
    
    func getProviders() {
        if dataMager.providers.count > 0 {
            
            presenter.showProviders(dataMager.providers)
            
        } else {
            
            dataMager.loadProviders({ (providers, error) in
                
                if let providers = providers {
                    
                    self.presenter.showProviders(providers)

                }
            })
        }
    }
}
