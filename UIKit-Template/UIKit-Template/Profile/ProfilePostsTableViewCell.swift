// ProfilePostsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка отображения изображений-превью постов в Профиле пользователя
final class ProfilePostsTableViewCell: UITableViewCell {
    
    // MARK: - Visual Components

    private var collectionView: UICollectionView!
    private var layout: UICollectionViewFlowLayout!

    // MARK: - Private Properties
    
    private var posts = Profile.createPosts(with: 15)
    
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
        setupCollectionView()
    }

    private func setupCollectionView() {
        layout = setupFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        collectionView.dataSource = self
        collectionView.register(PostImageCell.self, forCellWithReuseIdentifier: "\(PostImageCell.self)")
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        layout.minimumLineSpacing = 1.5
        layout.minimumInteritemSpacing = 1.5

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
        cell.imageView.image = UIImage(named: posts[indexPath.item])
        return cell
    }
}
