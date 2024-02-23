// ProfileTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ProfileTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let boldFont = UIFont(name: "Verdana-Bold", size: 14)
        static let regularFont = UIFont(name: "Verdana", size: 14)
        static let buttonFont = UIFont(name: "Verdana-Bold", size: 10)
        static let smallFont = UIFont(name: "Verdana", size: 10)

        static let publications = "публикации"
        static let subscribers = "подписчики"
        static let subscriptions = "подписки"

        static let changeButtonTitle = "Изменить"
        static let shareProfileButtonTitle = "Поделиться профилем"

        static let addButtonColor = #colorLiteral(red: 0.9119741321, green: 0.2736012042, blue: 0.368863225, alpha: 1)
        static let linkButtonColor = #colorLiteral(red: 0.136134088, green: 0.4076906741, blue: 0.7084419131, alpha: 1)
        static let buttonsColor = #colorLiteral(red: 0.9353198409, green: 0.9353198409, blue: 0.9353198409, alpha: 1)
        static let linkButtonTitle = "📎 www.spacex.com"
    }

    // MARK: - Visual COmponents

    private let avatarImageView = UIImageView()
    private let addStoryButton = UIButton()
    private let postsCountLabel = UILabel()
    private let subscribersCountLabel = UILabel()
    private let subscriptionsCountLabel = UILabel()
    private let publicationsLabel = UILabel()
    private let subscribersLabel = UILabel()
    private let subscriptionsLabel = UILabel()
    private let fullnameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let linkButton = UIButton()
    private let changeButton = UIButton()
    private let shareProfileButton = UIButton()
    private let addFriendButton = UIButton()

    // MARK: - Public Properties

    var profile = Profile.createProfile()

//    var profile = Profile(userLogin: "", userName: "", avatar: "", description: "", publicationsQuantity: 0,
//    subscribersQuantity: 0, subscriptionsQuantity: 0, link: "", highlights: [], posts: [])

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentView.backgroundColor = .white

        let elements = [
            avatarImageView,
            addStoryButton,
            postsCountLabel,
            subscribersCountLabel,
            subscriptionsCountLabel,
            publicationsLabel,
            subscribersLabel,
            subscriptionsLabel,
            fullnameLabel,
            descriptionLabel,
            linkButton,
            changeButton,
            shareProfileButton,
            addFriendButton
        ]
        elements.forEach { contentView.addSubview($0) }

        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }

        setupProfileElements()
        setConstraints()
    }

    private func setupProfileElements() {
        avatarImageView.image = UIImage(named: profile.avatar)
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true

        addStoryButton.setTitle("+", for: .normal)
        addStoryButton.tintColor = .white
        addStoryButton.backgroundColor = Constants.addButtonColor
        addStoryButton.layer.cornerRadius = 14

        postsCountLabel.text = String(profile.publicationsQuantity)
        postsCountLabel.font = Constants.boldFont
        postsCountLabel.textAlignment = .center

        subscribersCountLabel.text = String(profile.subscribersQuantity)
        subscribersCountLabel.font = Constants.boldFont
        subscribersCountLabel.textAlignment = .center

        subscriptionsCountLabel.text = String(profile.subscriptionsQuantity)
        subscriptionsCountLabel.font = Constants.boldFont
        subscriptionsCountLabel.textAlignment = .center

        publicationsLabel.text = Constants.publications
        publicationsLabel.font = Constants.smallFont
        publicationsLabel.textAlignment = .center

        subscribersLabel.text = Constants.subscribers
        subscribersLabel.font = Constants.smallFont
        subscribersLabel.textAlignment = .center

        subscriptionsLabel.text = Constants.subscriptions
        subscriptionsLabel.font = Constants.smallFont
        subscriptionsLabel.textAlignment = .center

        fullnameLabel.text = profile.userName
        fullnameLabel.font = Constants.boldFont

        descriptionLabel.text = profile.description
        descriptionLabel.font = Constants.regularFont
        descriptionLabel.numberOfLines = 0

        linkButton.setTitle(Constants.linkButtonTitle, for: .normal)
        linkButton.setTitleColor(Constants.linkButtonColor, for: .normal)
        linkButton.titleLabel?.font = Constants.regularFont
        linkButton.contentHorizontalAlignment = .left
        linkButton.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)

        changeButton.setTitle(Constants.changeButtonTitle, for: .normal)
        changeButton.setTitleColor(.black, for: .normal)
        changeButton.titleLabel?.font = Constants.buttonFont
        changeButton.backgroundColor = Constants.buttonsColor
        changeButton.layer.cornerRadius = 8

        shareProfileButton.setTitle(Constants.shareProfileButtonTitle, for: .normal)
        shareProfileButton.setTitleColor(.black, for: .normal)
        shareProfileButton.titleLabel?.font = Constants.buttonFont
        shareProfileButton.backgroundColor = Constants.buttonsColor
        shareProfileButton.layer.cornerRadius = 8

        addFriendButton.setImage(.addFriendIcon, for: .normal)
        addFriendButton.backgroundColor = Constants.buttonsColor
        addFriendButton.layer.cornerRadius = 8
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            addStoryButton.widthAnchor.constraint(equalToConstant: 27),
            addStoryButton.heightAnchor.constraint(equalToConstant: 27),
            addStoryButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            addStoryButton.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),

            postsCountLabel.widthAnchor.constraint(equalToConstant: 50),
            postsCountLabel.heightAnchor.constraint(equalToConstant: 17),
            postsCountLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 10),
            postsCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 151),

            subscribersCountLabel.widthAnchor.constraint(equalToConstant: 50),
            subscribersCountLabel.heightAnchor.constraint(equalToConstant: 17),
            subscribersCountLabel.centerYAnchor.constraint(equalTo: postsCountLabel.centerYAnchor),
            subscribersCountLabel.leadingAnchor.constraint(equalTo: postsCountLabel.trailingAnchor, constant: 20),

            subscriptionsCountLabel.widthAnchor.constraint(equalToConstant: 50),
            subscriptionsCountLabel.heightAnchor.constraint(equalToConstant: 17),
            subscriptionsCountLabel.centerYAnchor.constraint(equalTo: subscribersCountLabel.centerYAnchor),
            subscriptionsCountLabel.leadingAnchor.constraint(
                equalTo: subscribersCountLabel.trailingAnchor,
                constant: 21
            ),

            publicationsLabel.widthAnchor.constraint(equalToConstant: 70),
            publicationsLabel.heightAnchor.constraint(equalToConstant: 12),
            publicationsLabel.centerXAnchor.constraint(equalTo: postsCountLabel.centerXAnchor),
            publicationsLabel.topAnchor.constraint(equalTo: postsCountLabel.bottomAnchor, constant: 2),

            subscribersLabel.widthAnchor.constraint(equalToConstant: 70),
            subscribersLabel.heightAnchor.constraint(equalToConstant: 12),
            subscribersLabel.centerXAnchor.constraint(equalTo: subscribersCountLabel.centerXAnchor),
            subscribersLabel.topAnchor.constraint(equalTo: subscribersCountLabel.bottomAnchor, constant: 2),

            subscriptionsLabel.widthAnchor.constraint(equalToConstant: 70),
            subscriptionsLabel.heightAnchor.constraint(equalToConstant: 12),
            subscriptionsLabel.centerXAnchor.constraint(equalTo: subscriptionsCountLabel.centerXAnchor),
            subscriptionsLabel.topAnchor.constraint(equalTo: subscriptionsCountLabel.bottomAnchor, constant: 2),

            fullnameLabel.widthAnchor.constraint(equalToConstant: 170),
            fullnameLabel.heightAnchor.constraint(equalToConstant: 17),
            fullnameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 9),
            fullnameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),

            descriptionLabel.widthAnchor.constraint(equalToConstant: 298),
            descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 17),
            descriptionLabel.topAnchor.constraint(equalTo: fullnameLabel.bottomAnchor, constant: 11),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),

            linkButton.widthAnchor.constraint(equalToConstant: 298),
            linkButton.heightAnchor.constraint(equalToConstant: 17),
            linkButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            linkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),

            changeButton.widthAnchor.constraint(equalToConstant: 155),
            changeButton.heightAnchor.constraint(equalToConstant: 28),
            changeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            changeButton.topAnchor.constraint(equalTo: linkButton.bottomAnchor, constant: 15),

            shareProfileButton.widthAnchor.constraint(equalToConstant: 155),
            shareProfileButton.heightAnchor.constraint(equalToConstant: 28),
            shareProfileButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5),
            shareProfileButton.centerYAnchor.constraint(equalTo: changeButton.centerYAnchor),

            addFriendButton.widthAnchor.constraint(equalToConstant: 25),
            addFriendButton.heightAnchor.constraint(equalToConstant: 28),
            addFriendButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 5),
            addFriendButton.centerYAnchor.constraint(equalTo: changeButton.centerYAnchor)

        ])
    }

    @objc private func linkButtonTapped() {
        print("Link tapped")
    }
}
