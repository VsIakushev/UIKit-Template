// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для отображения уведомлений
final class NotificationsViewController: UIViewController {
    enum RowsType {
        case notificationPost
        case notificationSubscription
    }

    // MARK: - Constants

    enum Constants {
        static let title = "Уведомления"
        static let subscribeRequestText = "Запросы на подписку"
        static let titleFont = UIFont(name: "Verdana-Bold", size: 22)
        static let smallTitleFont = UIFont(name: "Verdana-Bold", size: 14)
        static let regularFont = UIFont(name: "Verdana", size: 14)
        static let notificationPostIdentifier = "notificationPost"
        static let notificationSubscriptionIdentifier = "notificationSubscribtion"
        static let firstSectionTitle = "Сегодня"
        static let secondSectionTitle = "На этой неделе"
    }

    // MARK: - Visual Components

    let requestsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.subscribeRequestText
        label.font = Constants.regularFont
        return label
    }()

    lazy var notificationTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            NotificationPostViewCell.self,
            forCellReuseIdentifier: Constants.notificationPostIdentifier
        )
        tableView.register(
            NotificationSubscriptionViewCell.self,
            forCellReuseIdentifier: Constants.notificationSubscriptionIdentifier
        )

        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    // MARK: - Private Properties

    private let notificationPosts = DataExamples.createNotificationPosts()
    private let notificationSubscriptions = DataExamples.createNotificationSubscriptions()

    private let typeRows: [RowsType] = [.notificationPost, .notificationSubscription]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        addViews()
        setConstraints()
    }

    // MARK: - Private Methods

    private func setupNavigation() {
        title = Constants.title
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: Constants.titleFont ?? UIFont.boldSystemFont(ofSize: 28)
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func addViews() {
        view.addSubview(requestsLabel)
        view.addSubview(notificationTableView)
    }

    private func setConstraints() {
        requestsLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            requestsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            requestsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            requestsLabel.widthAnchor.constraint(equalToConstant: 250),
            requestsLabel.heightAnchor.constraint(equalToConstant: 17),

            notificationTableView.topAnchor.constraint(equalTo: requestsLabel.bottomAnchor, constant: 20),
            notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - Extension UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        typeRows.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let typeRow = typeRows[section]
        switch typeRow {
        case .notificationPost:
            return notificationPosts.count
        case .notificationSubscription:
            return notificationSubscriptions.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = typeRows[indexPath.section]
        switch typeCell {
        case .notificationPost:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.notificationPostIdentifier,
                for: indexPath
            ) as? NotificationPostViewCell {
                cell.configureCell(notification: notificationPosts[indexPath.row])
            }

        case .notificationSubscription:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.notificationSubscriptionIdentifier,
                for: indexPath
            ) as? NotificationSubscriptionViewCell {
                cell.configureCell(notification: notificationSubscriptions[indexPath.row])
            }
        }
        return UITableViewCell()
    }
}

// MARK: - Extension UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        label.frame = CGRect(x: 12, y: 0, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        label.text = section == 0 ? Constants.firstSectionTitle : Constants.secondSectionTitle
        label.font = Constants.smallTitleFont
        label.textColor = .black
        headerView.addSubview(label)
        return headerView
    }
}
