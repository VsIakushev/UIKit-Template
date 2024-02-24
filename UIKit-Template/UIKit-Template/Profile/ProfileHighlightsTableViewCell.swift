// ProfileHighlightsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для отображения Хайлайтс в Профиле пользователя
final class ProfileHighlightsTableViewCell: UITableViewCell {
    // Constants
    enum Constants {
        static let regularFont = UIFont(name: "Verdana", size: 10)
    }

    // MARK: - Visual Components

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Private Properties

    private var highlights = Highlight.createHighlights()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(scrollView)
        setConstraints()

        scrollView.subviews.forEach { $0.removeFromSuperview() }

        var leadingAnchor = scrollView.leadingAnchor

        for highlight in highlights {
            let backgroundView = createHighlight(for: highlight)
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(backgroundView)

            NSLayoutConstraint.activate([
                backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
                backgroundView.widthAnchor.constraint(equalToConstant: 74),
                backgroundView.heightAnchor.constraint(equalToConstant: 76),
                backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
            ])
            leadingAnchor = backgroundView.trailingAnchor
        }
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8)
        ])
    }

    private func createHighlight(for highlight: Highlight) -> UIView {
        let backgroundView = UIView()

        let highlightImageView = UIImageView(image: UIImage(named: highlight.image))
        highlightImageView.translatesAutoresizingMaskIntoConstraints = false
        highlightImageView.contentMode = .scaleAspectFill
        highlightImageView.layer.cornerRadius = 25
        highlightImageView.clipsToBounds = true
        backgroundView.addSubview(highlightImageView)

        let ringView = UIView()
        ringView.translatesAutoresizingMaskIntoConstraints = false
        ringView.backgroundColor = .clear
        ringView.layer.borderWidth = 1
        ringView.layer.cornerRadius = 27.5
        ringView.layer.borderColor = UIColor.lightGray.cgColor
        backgroundView.addSubview(ringView)

        let highlightTitleLabel = UILabel()
        highlightTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        highlightTitleLabel.text = highlight.title
        highlightTitleLabel.font = Constants.regularFont
        highlightTitleLabel.textAlignment = .center
        backgroundView.addSubview(highlightTitleLabel)

        NSLayoutConstraint.activate([
            highlightImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            highlightImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            highlightImageView.widthAnchor.constraint(equalToConstant: 50),
            highlightImageView.heightAnchor.constraint(equalToConstant: 50),

            ringView.centerXAnchor.constraint(equalTo: highlightImageView.centerXAnchor),
            ringView.centerYAnchor.constraint(equalTo: highlightImageView.centerYAnchor),
            ringView.widthAnchor.constraint(equalToConstant: 55),
            ringView.heightAnchor.constraint(equalToConstant: 55),

            highlightTitleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            highlightTitleLabel.topAnchor.constraint(equalTo: highlightImageView.bottomAnchor, constant: 7),
            highlightTitleLabel.widthAnchor.constraint(equalToConstant: 55),
            highlightTitleLabel.heightAnchor.constraint(equalToConstant: 12)
        ])

        return backgroundView
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 91)

        ])
    }
}
