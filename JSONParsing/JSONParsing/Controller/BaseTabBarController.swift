//
//  AllTabBarController.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/27.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem.title = "更新"
        
        let bookVC = UINavigationController(rootViewController: BookViewController())
        bookVC.tabBarItem.title = "书籍"
        
        let setVCs = [homeViewController, bookVC,]
        
        self.setViewControllers( setVCs, animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["graduationcap", "book.closed",]
        for item in 0..<items.count {
            items[item].image = UIImage(systemName: images[item])
        }
        
    }

    
}
