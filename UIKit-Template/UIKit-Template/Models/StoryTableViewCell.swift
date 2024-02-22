// StoryTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка элемента ленты сторис
final class StoryTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let nameFont = UIFont(name: "Verdana", size: 8)
        static let addButtonColor = #colorLiteral(red: 0.9119741321, green: 0.2736012042, blue: 0.368863225, alpha: 1)
    }

    // MARK: - Public Properties

    var authors: [Author] = [] {
        didSet {
            updateUI()
        }
    }

    // MARK: - Private Properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 94)
        ])
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func updateUI() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }

        var leadingAnchor = scrollView.leadingAnchor

        for (index, author) in authors.enumerated() {
            let backgroundView = UIView()
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(backgroundView)

            let avatarImageView = UIImageView(image: author.avatar)
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false
            avatarImageView.contentMode = .scaleAspectFill
            avatarImageView.layer.cornerRadius = 30
            avatarImageView.clipsToBounds = true
            backgroundView.addSubview(avatarImageView)

            let nameLabel = UILabel()
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.text = author.name
            nameLabel.font = Constants.nameFont
            nameLabel.textAlignment = .center
            backgroundView.addSubview(nameLabel)

            NSLayoutConstraint.activate([
                backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
                backgroundView.widthAnchor.constraint(equalToConstant: 74),
                backgroundView.heightAnchor.constraint(equalToConstant: 76),
                backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
            ])

            NSLayoutConstraint.activate([
                avatarImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                avatarImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0),
                avatarImageView.widthAnchor.constraint(equalToConstant: 60),
                avatarImageView.heightAnchor.constraint(equalToConstant: 60)
            ])

            NSLayoutConstraint.activate([
                nameLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8),
                nameLabel.widthAnchor.constraint(equalToConstant: 60),
                nameLabel.heightAnchor.constraint(equalToConstant: 10)
            ])

            if index == 0 {
                nameLabel.textColor = .gray

                let addButton = UIButton(type: .custom)
                addButton.translatesAutoresizingMaskIntoConstraints = false
                addButton.setTitle("+", for: .normal)
                addButton.tintColor = .white
                addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
                addButton.backgroundColor = Constants.addButtonColor
                addButton.layer.cornerRadius = 10
                backgroundView.addSubview(addButton)

                NSLayoutConstraint.activate([
                    addButton.widthAnchor.constraint(equalToConstant: 20),
                    addButton.heightAnchor.constraint(equalToConstant: 20),
                    addButton.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
                    addButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor)
                ])
            }

            leadingAnchor = backgroundView.trailingAnchor
        }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8)
        ])
    }

    @objc private func addButtonTapped() {
        print("Add story tapped")
    }
}
