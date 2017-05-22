//
//  PostsViewController.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit
import AlamofireImage

class PostsViewController: UITableViewController, PostsViewInterface {
    
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    
    @IBOutlet weak var updateBarButton: UIBarButtonItem!
    
    var presenter: PostsPresenterInterface!
    
    weak internal var controller: UIViewController? {
        return self
    }
    
    var posts = [Post]()
    
    var page = 1
    var totalCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (navigationController?.viewControllers.count)! == 1 {
            backBarButton.isEnabled = false
            backBarButton.tintColor = UIColor.clear
        }
        
        if presenter.author != nil {
            updateBarButton.isEnabled = false
            updateBarButton.tintColor = UIColor.clear
        }
        
        setBackgoundGradient()
        
        configureRefreshControl()
    
        initData()
    }
    
    func setBackgoundGradient() {
        let backgroundView = LinearGradientView(frame: self.tableView.bounds)
        backgroundView.startColor = UIColor(red: (27/255.0), green: (28/255.0), blue:(31/255.0), alpha: 1)
        backgroundView.endColor = UIColor(red: (42/255.0), green: (48/255.0), blue:(66/255.0), alpha: 1)
        
        tableView.backgroundView = backgroundView
       
        tableView.backgroundView?.layer.zPosition -= 1;
    }
    
    func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(PostsViewController.refreshAction),
                                  for: UIControlEvents.valueChanged)
        let refreshControlIV = UIImageView(frame: CGRect(x: 0, y: 0,
                                                         width: (refreshControl?.bounds.height)!,
                                                         height: (refreshControl?.bounds.height)!))
        
        refreshControlIV.center = (refreshControl?.center)!
        refreshControlIV.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        
        refreshControlIV.image = UIImage(named:"placeholder")!
        
        refreshControl?.addSubview(refreshControlIV)

    }
    
    // MARK: - Actions
    
    func refreshAction(sender:AnyObject) {
        initData()
    }
    
    @IBAction func menuAction(_ sender: Any) {
        presenter.toggleMenu()
    }
    
    @IBAction func updateAction(_ sender: Any) {
        presenter.updatePosts()
    }
    
    @IBAction func backAction(_ sender: Any) {
        presenter.popViewController()
    }
    
    @IBAction func authorTapAction(_ sender: UIButton) {
        
        if let author = sender.titleLabel?.text {
        
                presenter.presentSubPosts(with: author)
            
        }
    }
    
    // MARK: - PostsViewInterface
    
    func showPosts(_ posts: [Post], _ totalCount: Int) {
        
        self.posts = posts
        self.totalCount = totalCount

        self.tableView.reloadData()
        
        self.refreshControl?.endRefreshing()
    }
    
    func addPostFromNextPage(_ posts: [Post]) {
        
        self.posts.append(contentsOf: posts)
        
        self.tableView.reloadData()
    }
    
    func setCurrentTitle(_ title: String) {
        self.title = title
    }

    func initData(){
        page = 1
        presenter.getPosts()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "postCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier,  for: indexPath) as! PostTableViewCell
        
        let post = posts[indexPath.row]
        
        cell.postTitleLabel.text = post.title
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        
        if let date = post.published {
            cell.postDateLabel.text = dateFormatter.string(from: date)
        }
        
        cell.postImageView.image = nil
        
        if post.images.count > 0 {
            
            cell.postImageView.backgroundColor = UIColor(string:(post.images[0].color))
            cell.postImageView.af_setImage(withURL: post.images[0].image, placeholderImage: nil)
        }
        
        cell.authorNameButton.setTitle(post.providerAuthorName, for: .normal)
        cell.authorImageView.image = nil
        
        if let avatarUrl = post.providerAuthorAvatar {
            cell.authorImageView.af_setImage(withURL: avatarUrl, placeholderImage: nil)
        }
        
        cell.likesCountLabel.text = "\(post.likesCount)"
        cell.viewsCountLabel.text = "\(post.viewsCount)"
        cell.boardsCountLabel.text = "\(post.boardsCount)"
        
        if indexPath.row == posts.count - 1 {
            page += 1
            
            if totalCount > posts.count {
                presenter.getPostsFor(page)
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 410
    }
    
}
