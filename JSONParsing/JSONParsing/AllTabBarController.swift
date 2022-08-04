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
        //self.tabBar.backgroundColor = .clear

        //首页
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        //我的
        let personalViewController = UINavigationController(rootViewController: PersonalViewController())
        
        self.setViewControllers([homeViewController, personalViewController], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["list.bullet.rectangle", "person"]
        for item in 0..<items.count {
            //items[0].badgeValue = "2"
            items[item].image = UIImage(systemName: images[item])
        }
        
    }

    
}
