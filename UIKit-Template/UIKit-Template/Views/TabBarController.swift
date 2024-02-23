// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class TabBarController: UITabBarController {
    // Constants
    enum Constants {
        static let feed = "Лента"
        static let notifications = "Уведомления"
        static let profile = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    // MARK: - Private Methods

    private func setupTabBar() {
        view.backgroundColor = .white

        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        feedNavigationController.tabBarItem = UITabBarItem(
            title: Constants.feed,
            image: .feedIcon,
            tag: 0
        )

        let notificationsNavigationController =
            UINavigationController(rootViewController: NotificationsViewController())
        notificationsNavigationController.tabBarItem = UITabBarItem(
            title: Constants.notifications,
            image: .notificationsIcon,
            tag: 1
        )

        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
        profileNavigationController.tabBarItem = UITabBarItem(
            title: Constants.profile,
            image: .profileIcon,
            tag: 2
        )

        setViewControllers(
            [feedNavigationController, notificationsNavigationController, profileNavigationController], animated: true
        )
        tabBar.unselectedItemTintColor = .black
    }
}
