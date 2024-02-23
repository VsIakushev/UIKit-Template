// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с данными пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let userName = "mary_rmLink"
        static let loginFont = UIFont(name: "Verdana-Bold", size: 18)
        static let profileCellIdentifier = "profileCellIdentifier"
        static let highlightsCellIdentifier = "highlightsCellIdentifier"
        static let postsCellIdentifier = "postsCellIdentifier"
    }

    // MARK: - Private Properties

    private let profile = Profile.createProfile()

    private var tableView = UITableView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        setupNavigation()
        setupTableView()
    }

    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none

        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: Constants.profileCellIdentifier)
        tableView.register(
            ProfileHighlightsTableViewCell.self,
            forCellReuseIdentifier: Constants.highlightsCellIdentifier
        )
        tableView.register(ProfilePostsTableViewCell.self, forCellReuseIdentifier: Constants.postsCellIdentifier)
    }

    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = false

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 22))

        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage.lockIcon, for: .normal)
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
            image: UIImage.addIcon,
            style: .plain,
            target: self,
            action: #selector(addButtonTapped)
        )
        addButton.tintColor = .black

        let menuButton = UIBarButtonItem(
            image: UIImage.kebabMenuIcon,
            style: .plain,
            target: self,
            action: #selector(menuButtonTapped)
        )
        menuButton.tintColor = .black

        navigationItem.rightBarButtonItems = [menuButton, addButton]
    }

    @objc func leftButtonTapped() {}

    @objc func addButtonTapped() {}

    @objc func menuButtonTapped() {}
}

// MARK: - ProfileViewController + UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220
        } else if indexPath.row == 1 {
            return 100
        } else {
            return 450
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let topOffset = -tableView.safeAreaInsets.top
        if scrollView.contentOffset.y < topOffset {
            scrollView.contentOffset.y = topOffset
        }
    }
}

// MARK: - ProfileViewController + UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileCellIdentifier,
                for: indexPath
            ) as? ProfileTableViewCell {
                return cell
            }
        } else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.highlightsCellIdentifier,
                for: indexPath
            ) as? ProfileHighlightsTableViewCell {
                return cell
            }
        } else if indexPath.row == 2 {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postsCellIdentifier,
                for: indexPath
            ) as? ProfilePostsTableViewCell {
                return cell
            }
        }

        return UITableViewCell()
    }
}
