//
//  SplashViewController.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController, SplashViewInterface {
    
    @IBOutlet weak var refreshButton: UIButton!
    
    var presenter: SplashPresenterInterface!
    
    weak internal var controller: UIViewController? {
        return self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.initData()
    }
    
    func setRefreshHidden(_ hidden: Bool) {
        refreshButton.isHidden = hidden
    }

    @IBAction func refreshAction(_ sender: Any) {
        presenter.initData()
    }
}
