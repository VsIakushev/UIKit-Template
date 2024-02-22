// NotificationSubscriptionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка списка уведомлений о подписках
final class NotificationSubscriptionViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let subscribe = "Подписаться"
        static let unSubscribe = "Вы подписаны"
        static let boldFont = UIFont(name: "Verdana-Bold", size: 12)
        static let regularFont = UIFont(name: "Verdana", size: 12)
        static let buttonFont = UIFont(name: "Verdana-Bold", size: 10)
        static let buttonColor = #colorLiteral(red: 0.2012029588, green: 0.480709672, blue: 1, alpha: 1)
    }

    private let authorAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Constants.regularFont
        label.numberOfLines = 0
        return label
    }()

    private lazy var comentedImageView: UIImageView = {
        let image = UIImageView()

        return image
    }()

    // MARK: - Visual Components

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.titleLabel?.font = Constants.buttonFont
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
        return button
    }()

    private var isSubscribe = false

    // MARK: - Public Properties

    func configureCell(notification: NotificationSubscription) {
        authorAvatarImageView.image = notification.author.avatar
        let text = ""
        descriptionLabel.attributedText = text.configureDescriptionsFormat(
            nameString: notification.author.name,
            descriptionString: notification.postDescription,
            dateString: notification.dateComment
        )

        subscribeButton.setTitle(notification.isPressed ? Constants.unSubscribe : Constants.subscribe, for: .normal)
        subscribeButton.backgroundColor = notification.isPressed ? .white : Constants.buttonColor
        subscribeButton.setTitleColor(notification.isPressed ? .gray : .white, for: .normal)
        subscribeButton.layer.borderColor = notification.isPressed ? UIColor.gray.cgColor : Constants.buttonColor
            .cgColor
        isSubscribe = notification.isPressed
        contentView.addSubview(authorAvatarImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(subscribeButton)
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        authorAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            authorAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            authorAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            authorAvatarImageView.widthAnchor.constraint(equalToConstant: 40),
            authorAvatarImageView.heightAnchor.constraint(equalToConstant: 40),

            subscribeButton.centerYAnchor.constraint(equalTo: authorAvatarImageView.centerYAnchor),
            subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            subscribeButton.widthAnchor.constraint(equalToConstant: 140),
            subscribeButton.heightAnchor.constraint(equalToConstant: 30),

            descriptionLabel.topAnchor.constraint(equalTo: authorAvatarImageView.topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: subscribeButton.leadingAnchor, constant: -24),
            descriptionLabel.leadingAnchor.constraint(equalTo: authorAvatarImageView.trailingAnchor, constant: 7),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

    @objc private func selectedButton() {
        subscribeButton.setTitle(isSubscribe ? Constants.unSubscribe : Constants.subscribe, for: .normal)
        subscribeButton.backgroundColor = isSubscribe ? .white : .systemBlue
        subscribeButton.setTitleColor(isSubscribe ? .gray : .white, for: .normal)
        subscribeButton.layer.borderColor = isSubscribe ? UIColor.gray.cgColor : UIColor.systemBlue.cgColor
        isSubscribe.toggle()
    }
}
