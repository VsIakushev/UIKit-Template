// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для отображения уведомлений
final class NotificationsViewController: UIViewController {
    /// Перечисление секций в уведомлениях
    enum CellTypeNotifications {
        /// Сегодняшние уведомления
        case today
        /// Уведомления этой недели
        case thisWeek
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

    private let todayType = [
        NotificationPost(
            author: Author(name: "lavanda123", avatar: "lavanda"),
            postDescription: "Понравился ваш комментарий: \"Очень красиво!\"",
            dateComment: "10ч",
            postPicture: "mountains"
        ),
        NotificationPost(
            author: Author(name: "lavanda123", avatar: "lavanda"),
            postDescription: "упомянул(-а) вас в комментарии: @rm Спасибо!",
            dateComment: "11ч",
            postPicture: "mountains1"
        )
    ]

    private let thisWeekType: [Any] = [
        NotificationPost(
            author: Author(name: "lavanda123", avatar: "lavanda"),
            postDescription: "упомянул(-а) вас в комментарии: @rm Спасибо!",
            dateComment: "1д",
            postPicture: "mountains1"
        ),
        NotificationSubscription(
            author: Author(name: "12miho", avatar: "guy"),
            postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
            dateComment: "3д",
            isPressed: false
        ),
        NotificationSubscription(
            author: Author(name: "lavanda123", avatar: "lavanda"),
            postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
            dateComment: "5д",
            isPressed: true
        ),
        NotificationPost(
            author: Author(name: "lavanda123", avatar: "lavanda"),
            postDescription: "Понравился ваш комментарий: \"Это вы где?\"",
            dateComment: "6д",
            postPicture: "crimea"
        ),
        NotificationSubscription(
            author: Author(name: "crimea_tours", avatar: "crimea"),
            postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
            dateComment: "7д",
            isPressed: false
        )
    ]

    private let content: [CellTypeNotifications] = [.today, .thisWeek]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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
        view.backgroundColor = .white
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

// MARK: - NotificationViewController + UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = content[section]
        switch cell {
        case .today: return todayType.count
        case .thisWeek: return thisWeekType.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = content[indexPath.section]
        switch items {
        case .today:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.notificationPostIdentifier,
                for: indexPath
            ) as? NotificationPostViewCell
            else { return UITableViewCell() }
            cell.configureCell(notification: todayType[indexPath.row])

            return cell
        case .thisWeek:
            if let userPost = thisWeekType[indexPath.row] as? NotificationSubscription {
                if let cell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.notificationSubscriptionIdentifier,
                    for: indexPath
                ) as? NotificationSubscriptionViewCell {
                    cell.configureCell(notification: userPost)
                    return cell
                }
            } else if let userPost = thisWeekType[indexPath.row] as? NotificationPost {
                if let cell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.notificationPostIdentifier,
                    for: indexPath
                ) as? NotificationPostViewCell {
                    cell.configureCell(notification: userPost)
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}

// MARK: - NotificationViewController + UITableViewDelegate

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
