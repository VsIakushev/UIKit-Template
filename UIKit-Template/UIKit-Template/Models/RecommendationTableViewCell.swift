// RecommendationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка элемента ленты рекомендаций
final class RecommendationTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let sectionTitle = "Рекомендуем вам"
        static let titleFont = UIFont(name: "Verdana-Bold", size: 10)
        static let nameFont = UIFont(name: "Verdana", size: 10)
        static let buttonColor = #colorLiteral(red: 0.2012029588, green: 0.480709672, blue: 1, alpha: 1)
        static let scrollViewBackgroundColor = #colorLiteral(red: 0.8221815228, green: 0.8752249479, blue: 0.9318071604, alpha: 1)
        static let buttonTitle = "Подписаться"
    }

    // MARK: - Public Properties

    var authors: [Author] = [] {
        didSet {
            updateUI()
        }
    }

    // MARK: - Visual Components

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let sectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.sectionTitle
        label.font = Constants.titleFont
        return label
    }()

    private let showAllButton = {
        let button = UIButton()
        button.setTitle("Все", for: .normal)
        button.setTitleColor(Constants.buttonColor, for: .normal)
        button.titleLabel?.font = Constants.titleFont
        button.addTarget(nil, action: #selector(showAllButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(scrollView)
        contentView.addSubview(sectionTitleLabel)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 270),

            sectionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            sectionTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            sectionTitleLabel.widthAnchor.constraint(equalToConstant: 107),
            sectionTitleLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func updateUI() {
        scrollView.subviews.forEach { $0.removeFromSuperview() }
        scrollView.backgroundColor = Constants.scrollViewBackgroundColor

        sectionTitleLabel.frame = CGRect(x: 12, y: 5, width: 107, height: 15)
        showAllButton.frame = CGRect(x: frame.width - 40, y: 9, width: 30, height: 15)

        contentView.addSubview(showAllButton)
        contentView.addSubview(sectionTitleLabel)

        var leadingAnchor = scrollView.leadingAnchor

        for author in authors {
            let backgroundView = UIView()
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.backgroundColor = .white
            scrollView.addSubview(backgroundView)

            let avatarImageView = UIImageView(image: author.avatar)
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false
            avatarImageView.contentMode = .scaleAspectFill
            avatarImageView.layer.cornerRadius = 60
            avatarImageView.clipsToBounds = true
            backgroundView.addSubview(avatarImageView)

            let nameLabel = UILabel()
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.text = author.name
            nameLabel.font = Constants.nameFont
            nameLabel.textAlignment = .center
            backgroundView.addSubview(nameLabel)

            let subscribeButton = UIButton()
            subscribeButton.translatesAutoresizingMaskIntoConstraints = false
            subscribeButton.setTitle(Constants.buttonTitle, for: .normal)
            subscribeButton.backgroundColor = Constants.buttonColor
            subscribeButton.tintColor = .white
            subscribeButton.layer.cornerRadius = 8
            subscribeButton.addTarget(self, action: #selector(subscribeButtonTapped), for: .touchUpInside)
            backgroundView.addSubview(subscribeButton)

            let hideButton = UIButton()
            hideButton.translatesAutoresizingMaskIntoConstraints = false
            hideButton.setImage(UIImage(systemName: "xmark"), for: .normal)
            hideButton.tintColor = .black
            hideButton.addTarget(self, action: #selector(hideButtonTapped), for: .touchUpInside)
            backgroundView.addSubview(hideButton)

            NSLayoutConstraint.activate([
                backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45),
                backgroundView.widthAnchor.constraint(equalToConstant: 185),
                backgroundView.heightAnchor.constraint(equalToConstant: 200),
                backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17)
            ])

            NSLayoutConstraint.activate([
                avatarImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                avatarImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
                avatarImageView.widthAnchor.constraint(equalToConstant: 115),
                avatarImageView.heightAnchor.constraint(equalToConstant: 115)
            ])

            NSLayoutConstraint.activate([
                nameLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5),
                nameLabel.widthAnchor.constraint(equalToConstant: 100),
                nameLabel.heightAnchor.constraint(equalToConstant: 12)
            ])

            NSLayoutConstraint.activate([
                subscribeButton.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                subscribeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 9),
                subscribeButton.widthAnchor.constraint(equalToConstant: 165),
                subscribeButton.heightAnchor.constraint(equalToConstant: 30)
            ])

            NSLayoutConstraint.activate([
                hideButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 9),
                hideButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -9),
                hideButton.widthAnchor.constraint(equalToConstant: 7),
                hideButton.heightAnchor.constraint(equalToConstant: 7)

            ])

            leadingAnchor = backgroundView.trailingAnchor
        }

        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
    }

    @objc private func subscribeButtonTapped() {}

    @objc private func hideButtonTapped() {}

    @objc private func showAllButtonTapped() {}
}
