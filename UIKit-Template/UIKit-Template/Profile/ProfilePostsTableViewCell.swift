// ProfilePostsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка отображения изображений-превью постов в Профиле пользователя
final class ProfilePostsTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let numberOfItemsInRow = 3
        static let spacing: CGFloat = 1.5
        static let itemWidth = (UIScreen.main.bounds.width - spacing * CGFloat(numberOfItemsInRow - 1)) /
            CGFloat(numberOfItemsInRow)
    }

    // MARK: - Visual Components

    private var collectionView: UICollectionView!
    private var layout: UICollectionViewFlowLayout!

    // MARK: - Private Properties

    private var posts = Profile.createPosts(with: 17)

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
        setupCollectionView(with: posts)
    }

    private func setupCollectionView(with imageNames: [String]) {
        layout = setupFlowLayout()

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            contentView.heightAnchor.constraint(equalToConstant: calculateContetnViewHeight())
        ])

        collectionView.dataSource = self
        collectionView.register(PostImageCell.self, forCellWithReuseIdentifier: "\(PostImageCell.self)")
    }

    private func calculateContetnViewHeight() -> CGFloat {
        var height: CGFloat = 0
        var numberOfRows = 0
        (posts.count % 3 == 0) ? (numberOfRows = posts.count / 3) : (numberOfRows = Int(posts.count / 3) + 1)
        height = (CGFloat(numberOfRows) * Constants.itemWidth) + (CGFloat(numberOfRows - 1) * Constants.spacing)
        return height
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Constants.itemWidth, height: Constants.itemWidth)
        layout.minimumLineSpacing = Constants.spacing
        layout.minimumInteritemSpacing = Constants.spacing

        return layout
    }
}

// MARK: - ProfilePostsTableViewCell + UICollectionViewDataSource

extension ProfilePostsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "\(PostImageCell.self)",
            for: indexPath
        ) as? PostImageCell else { return UICollectionViewCell() }
        cell.setImage(image: UIImage(named: posts[indexPath.item]) ?? UIImage())
        return cell
    }
}
