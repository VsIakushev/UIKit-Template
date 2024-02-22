// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с данными пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let userName = "mary_rmLink"
        static let loginFont = UIFont(name: "Verdana-Bold", size: 18)
    }

    // MARK: - Private Properties

    private let profile = DataExamples.createProfile()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupNavigation()
    }

    // MARK: - Private Methods

    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = false

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 22))

        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage.lock, for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        leftButton.frame = CGRect(x: 0, y: 0, width: 16, height: 18)
        containerView.addSubview(leftButton)

        let loginLabel = {
            let label = UILabel()
            label.text = profile.userLogin
            label.font = Constants.loginFont
            label.frame = CGRect(x: 26, y: 0, width: 170, height: 22)
            return label
        }()
        containerView.addSubview(loginLabel)

        let customBarItem = UIBarButtonItem(customView: containerView)

        navigationItem.leftBarButtonItem = customBarItem

        let addButton = UIBarButtonItem(
            image: UIImage.plusIcon,
            style: .plain,
            target: self,
            action: #selector(addButtonTapped)
        )
        addButton.tintColor = .black

        let menuButton = UIBarButtonItem(
            image: UIImage.kebabMenu,
            style: .plain,
            target: self,
            action: #selector(menuButtonTapped)
        )
        menuButton.tintColor = .black

        navigationItem.rightBarButtonItems = [menuButton, addButton]
    }

    @objc func leftButtonTapped() {
        // Обработка нажатия на левую кнопку
    }

    @objc func addButtonTapped() {
        // Обработка нажатия на кнопку добавления
    }

    @objc func menuButtonTapped() {
        // Обработка нажатия на кнопку меню
    }
}
