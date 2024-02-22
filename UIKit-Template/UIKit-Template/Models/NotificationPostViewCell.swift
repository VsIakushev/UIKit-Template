// NotificationPostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка списка уведомлений о действиях с постом
final class NotificationPostViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let boldFont = UIFont(name: "Verdana-Bold", size: 12)
        static let regularFont = UIFont(name: "Verdana", size: 12)
    }

    // MARK: - Visual Components

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
        label.numberOfLines = 2
        return label
    }()

    private lazy var comentedImageView: UIImageView = {
        let image = UIImageView()

        return image
    }()

    // MARK: - Public Properties

    func configureCell(notification: NotificationPost) {
        authorAvatarImageView.image = notification.author.avatar
        let text = ""
        descriptionLabel.attributedText = text.configureDescriptionsFormat(
            nameString: notification.author.name,
            descriptionString: notification.postDescription,
            dateString: notification.dateComment
        )
        comentedImageView.image = notification.postPicture
        contentView.addSubview(authorAvatarImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(comentedImageView)
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        authorAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        comentedImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            authorAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            authorAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            authorAvatarImageView.widthAnchor.constraint(equalToConstant: 40),
            authorAvatarImageView.heightAnchor.constraint(equalToConstant: 40),

            comentedImageView.topAnchor.constraint(equalTo: authorAvatarImageView.topAnchor),
            comentedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            comentedImageView.widthAnchor.constraint(equalToConstant: 40),
            comentedImageView.heightAnchor.constraint(equalToConstant: 40),

            descriptionLabel.topAnchor.constraint(equalTo: comentedImageView.topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: comentedImageView.leadingAnchor, constant: -24),
            descriptionLabel.leadingAnchor.constraint(equalTo: authorAvatarImageView.trailingAnchor, constant: 7),
            descriptionLabel.bottomAnchor.constraint(equalTo: comentedImageView.bottomAnchor)

        ])
    }
}
