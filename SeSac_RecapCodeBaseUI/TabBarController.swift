//
//  TabBarController.swift
//  SeSac_RecapCodeBaseUI
//
//  Created by youngjoo on 1/28/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTab = UINavigationController(rootViewController: SearchViewController())
        let firstTabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        firstTab.tabBarItem = firstTabBarItem
        
        let secondTab = UINavigationController(rootViewController: WishListViewController())
        let secondTabBarItem = UITabBarItem(title: "위시리스트", image: UIImage(systemName: "hand.thumbsup"), tag: 1)
        secondTab.tabBarItem = secondTabBarItem
        
        let thirdTab = UINavigationController(rootViewController: SettingViewController())
        let thirdTabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "person"), tag: 2)
        thirdTab.tabBarItem = thirdTabBarItem
        
        self.viewControllers = [firstTab, secondTab, thirdTab]
    }

}
