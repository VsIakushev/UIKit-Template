// PostImageCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Изображение-превью поста в Профиле пользователя
final class PostImageCell: UICollectionViewCell {
    // MARK: - Public Properties

    let imageView = UIImageView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        clipsToBounds = true

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 124),
            imageView.heightAnchor.constraint(equalToConstant: 124),

            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
