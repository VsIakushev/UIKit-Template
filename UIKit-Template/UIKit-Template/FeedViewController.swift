// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class FeedViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let appTitle = "RMLink"
        static let appTitleFont = "Dancing Script"
        static let appTitleFontSize = CGFloat(22)

        static let storyCellIdentifier = "storyCell"
        static let postCellIdentifier = "postCell"
        static let recommendationCellIdentifier = "recommendationCell"
    }

    var tableView = UITableView()

    var stories: [Author] = DataExamples.createStories()
    var posts: [Post] = DataExamples.createPosts()
    var recommendations: [Author] = DataExamples.createRecommendations()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        configureTableView()
    }

    // MARK: - Private Methods

    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        tableView.register(StoryTableViewCell.self, forCellReuseIdentifier: Constants.storyCellIdentifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Constants.postCellIdentifier)
        tableView.register(
            RecommendationTableViewCell.self,
            forCellReuseIdentifier: Constants.recommendationCellIdentifier
        )
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false

        let appTitleButton = UIButton()
        appTitleButton.frame = CGRect(x: 0, y: 0, width: 75, height: 26)
        appTitleButton.setImage(UIImage.appTitle, for: .normal)
        appTitleButton.addTarget(self, action: #selector(appTitleButtonTapped), for: .touchUpInside)

        let messagesButton = UIButton()
        messagesButton.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        messagesButton.setImage(UIImage.messagesIcon, for: .normal)
        messagesButton.addTarget(self, action: #selector(messagesButtonTapped), for: .touchUpInside)

        let leftBarButtonItem = UIBarButtonItem(customView: appTitleButton)
        let rightBarButtonItem = UIBarButtonItem(customView: messagesButton)

        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    @objc private func appTitleButtonTapped() {}

    @objc private func messagesButtonTapped() {}
}

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1 + 1 + posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.storyCellIdentifier,
                for: indexPath
            ) as? StoryTableViewCell {
                cell.authors = stories
                return cell
            }

        } else if indexPath.row == 2 {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recommendationCellIdentifier,
                for: indexPath
            ) as? RecommendationTableViewCell {
                cell.authors = recommendations
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postCellIdentifier,
                for: indexPath
            ) as? PostTableViewCell {
                guard indexPath.row < posts.count else {
                    return cell
                }
                let post = posts[indexPath.row]
                cell.configure(with: post)
                return cell
            }
        }

        return UITableViewCell()
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 94
        } else if indexPath.row == 2 {
            return 270
        } else {
//            return UITableView.automaticDimension
            return 450
        }
    }
}
