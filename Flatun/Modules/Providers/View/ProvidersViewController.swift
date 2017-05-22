//
//  ProvidersViewController.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class ProvidersViewController: UITableViewController, ProvidersViewInterface {
    
    var presenter: ProvidersPresenterInterface!
    
    weak internal var controller: UIViewController? {
        return self
    }
    
    var providers = [Provider]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgoundGradient()
        
        configureHeaderView()
        
        presenter.getProviders()
    }
    
    func setBackgoundGradient() {
        
        let backgroundView = LinearGradientView(frame: self.tableView.bounds)
        backgroundView.startColor = UIColor(red: (27/255.0), green: (28/255.0), blue:(31/255.0), alpha: 1)
        backgroundView.endColor = UIColor(red: (42/255.0), green: (48/255.0), blue:(66/255.0), alpha: 1)
        
        tableView.backgroundView = backgroundView
    }
    
    func configureHeaderView () {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: Menu.width, height: 80))
        
        let headerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: Menu.width / 2, height: 30))
        
        headerImageView.image = UIImage(named: "flatun")
        headerImageView.center = header.center
        
        header.addSubview(headerImageView)
        
        self.tableView.tableHeaderView = header
    }
    
    // MARK: - ProvidersViewInterface
    
    func showProviders(_ providers: [Provider]) {
        self.providers = providers
        
        self.tableView.reloadData()
    }

    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providers.count + 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "menuCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ProviderTableViewCell
        
        if indexPath.row == 0 {
            cell.providerNameLabel.text = "All feed"
            cell.providerImageView.image = UIImage(named: "allfeed")
            
            return cell
        }
        
        let provider = providers[indexPath.row - 1]
        
        cell.providerNameLabel.text = provider.name
        cell.providerImageView.image = nil
        
        cell.providerImageView.af_setImage(withURL: provider.image, placeholderImage: nil)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 0 {
            
            presenter.showPostsFor(provider: nil)
            return
        }
        
        let provider = providers[indexPath.row - 1]
        presenter.showPostsFor(provider: provider)
    }
    
}
