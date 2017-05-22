//
//  ProviderViewController+MenuExtension.swift
//  Flatun
//
//  Created by Антон Гостев on 22.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

extension ProvidersViewController {
    
    class Menu {
        static var isShowing = false
        
        static var generalViewController : UIViewController?
        
        static var width : CGFloat = 270
        
        static var mask : UIView?
    }
    
    func toggleMenu(_ viewController : UIViewController) {
        
        Menu.generalViewController = viewController
        let frame = self.view.bounds

        self.view.frame = CGRect(x: -Menu.width, y: 0, width: Menu.width, height: frame.height)

        self.view.autoresizingMask = .flexibleRightMargin

        viewController.view.addSubview(self.view)

        toggleDidTouch()
        
    }
    
    func closeMenu() {
        toggleDidTouch()
    }
    
    func addMaskOnView() {
        
        Menu.mask = UIView(frame: CGRect(x: view.frame.width,
                                    y: 0,
                                    width: UIScreen.main.bounds.width - view.frame.width,
                                    height: view.frame.height))
        
        Menu.mask?.autoresizingMask = .flexibleWidth
        Menu.mask?.backgroundColor = UIColor(colorLiteralRed: 0.7, green: 0.7, blue: 0.7, alpha: 0.3)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toggleDidTouch))
        
        Menu.mask?.addGestureRecognizer(gesture)
        
        Menu.generalViewController?.view.addSubview(Menu.mask!)
        
    }
    
    // MARK: - Toggle Action
    
    func toggleDidTouch() {
        
        let subViews = Menu.generalViewController?.view.subviews
        
        if Menu.isShowing {
            
            Menu.mask?.removeFromSuperview()
            
            UIView.animate(withDuration: 0.5, animations: {
                
                if let subViews = subViews {
                    for view in  subViews {
                        
                        if view == self.view {
                            view.center.x -= Menu.width
                        }
                    }
                }
            })
            
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                if let subViews = subViews {
                    for view in  subViews {
                        
                        if view == self.view {
                            view.center.x += Menu.width
                        }
                    }
                }
            }, completion: { (complete) in
                if complete {
                    
                    self.addMaskOnView()
                    
                }
            })
            
        }
        
        Menu.isShowing = !Menu.isShowing
    }
}
