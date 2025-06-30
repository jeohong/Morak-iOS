//
//  MainTabBarController.swift
//  Morak
//
//  Created by Hong jeongmin on 6/30/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabs()
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .theme.lightYellow
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTabs() {
        let postVC = PostViewController()
        let postNav = UINavigationController(rootViewController: postVC)
        postNav.navigationBar.isHidden = true
        postNav.tabBarItem = UITabBarItem(
            title: "포스트",
            image: UIImage(systemName: "text.document"),
            tag: 0
        )
        
        let chatVC = UIViewController()
        chatVC.view.backgroundColor = .white
        chatVC.tabBarItem = UITabBarItem(
            title: "채팅",
            image: UIImage(systemName: "bubble.right"),
            tag: 1
        )
        
        let freindsVC = UIViewController()
        freindsVC.view.backgroundColor = .white
        freindsVC.tabBarItem = UITabBarItem(
            title: "친구",
            image: UIImage(systemName: "person.3"),
            tag: 2
        )
        
        let settingVC = UIViewController()
        settingVC.view.backgroundColor = .white
        settingVC.tabBarItem = UITabBarItem(
            title: "설정",
            image: UIImage(systemName: "gear"),
            tag: 3
        )
        
        viewControllers = [postNav, chatVC, freindsVC, settingVC]
    }
}
