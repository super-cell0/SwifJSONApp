//
//  AllTabBarController.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/27.
//

import UIKit

class AllTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem.title = "更新"
        let personalViewController = UINavigationController(rootViewController: PersonalViewController())
        personalViewController.tabBarItem.title = "我的"
        let bookVC = UINavigationController(rootViewController: BookViewController())
        bookVC.tabBarItem.title = "书籍"
        let collectVC = CollectViewController()
        collectVC.tabBarItem.title = "收藏"
        
        let setVCs = [homeViewController, bookVC, collectVC, personalViewController]
        
        self.setViewControllers( setVCs, animated: false)
        
        guard let items = self.tabBar.items else { return }
        //guard let titles = self.tabBarItem.title else { return}
        
        let images = ["graduationcap", "book.closed", "bookmark" , "person"]
        for item in 0..<items.count {
            //items[0].badgeValue = "2"
            items[item].image = UIImage(systemName: images[item])
        }
        
        //let tabbarTitles = ["更新", "我的", "书籍", "收藏"]
//        for title in 0..<tabbarTitles.count {
//            titles[title].self = tabbarTitles[title]
//        }
        
    }

    
}
