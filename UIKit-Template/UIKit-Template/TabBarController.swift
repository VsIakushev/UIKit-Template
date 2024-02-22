// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTabBar()
    }

    private func setupTabBar() {
        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        let notificationsViewController = UINavigationController(rootViewController: NotificationsViewController())
        let profileViewController = ProfileViewController()

        feedNavigationController.tabBarItem.title = "Лента"
        feedNavigationController.tabBarItem.image = UIImage.feedIcon

        notificationsViewController.tabBarItem.title = "Уведомления"
        notificationsViewController.tabBarItem.image = UIImage.notificationsIcon

        profileViewController.tabBarItem.title = "Профиль"
        profileViewController.tabBarItem.image = UIImage.profileIcon

        viewControllers = [feedNavigationController, notificationsViewController, profileViewController]

        let separator = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        separator.backgroundColor = .lightGray
        tabBar.addSubview(separator)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            updateTabBatColors(selectedIndex: index)
        }
    }

    private func updateTabBatColors(selectedIndex: Int) {
        for (index, item) in tabBar.items!.enumerated() {
            if index == selectedIndex {
                item.setTitleTextAttributes([.foregroundColor: UIColor.appBlue], for: .normal)
                item.selectedImage = item.selectedImage?.withTintColor(.appBlue)
            } else {
                item.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
                item.selectedImage = item.selectedImage?.withTintColor(.black)
            }
        }
    }
}
