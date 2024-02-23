// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка элемента ленты постов
final class PostTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let boldFont = UIFont(name: "Verdana-Bold", size: 10)
        static let regularFont = UIFont(name: "Verdana", size: 10)
        static let commentPlaceholder = "Комментировать ..."
        static let myAvatar = UIImage.profilePhoto
        static let timeAgo = "10 минут назад"
    }

    // MARK: - Visual Components

    private let authorAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()

    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.boldFont
        return label
    }()

    private let actionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.ellipsisIcon, for: .normal)
        button.addTarget(nil, action: #selector(actionsButtonTapped), for: .touchUpInside)
        return button
    }()

    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.likeIcon, for: .normal)
        button.addTarget(nil, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()

    private let commentsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.commentIcon, for: .normal)
        button.addTarget(nil, action: #selector(commentsButtonTapped), for: .touchUpInside)
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.shareIcon, for: .normal)
        button.addTarget(nil, action: #selector(shareButtonTapped), for: .touchUpInside)
        return button
    }()

    private let bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.bookmarkIcon, for: .normal)
        button.addTarget(nil, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        return button
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.boldFont
        return label
    }()

    private let postText: UILabel = {
        let label = UILabel()
        label.font = Constants.regularFont
        label.numberOfLines = 0
        return label
    }()

    private let myAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    private let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.commentPlaceholder
        textField.font = Constants.regularFont
        return textField
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.regularFont
        label.textColor = .gray
        return label
    }()

    private var postImages = [UIImage]() {
        didSet {
            pageControl.isHidden = postImages.count <= 1
            pageControl.numberOfPages = postImages.count
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        selectionStyle = .none
    }

    // MARK: - Public Methods

    func configure(with post: Post) {
        authorAvatarImageView.image = UIImage(named: post.author.avatar)
        authorNameLabel.text = post.author.name
        timeLabel.text = Constants.timeAgo
        postImages = setupImages(strings: post.images)
        likesLabel.text = "Нравится: \(post.likes)"
        likesLabel.textColor = .black
        likesLabel.font = Constants.boldFont
        postText.text = post.text
        myAvatar.image = UIImage.profilePhoto
        configurateScrollView()
    }

    // MARK: - Private Methods

    private func setupImages(strings: [String]) -> [UIImage] {
        var images: [UIImage] = []
        strings.forEach { string in
            guard let image = UIImage(named: string) else { return }
            images.append(image)
        }
        return images
    }

    private func setupUI() {
        let elements = [
            authorAvatarImageView,
            authorNameLabel,
            actionsButton,
            likeButton,
            commentsButton,
            shareButton,
            bookmarkButton,
            likesLabel,
            postText,
            myAvatar,
            commentTextField,
            timeLabel,
        ]

        elements.forEach { addSubview($0) }
        elements.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        contentView.addSubview(scrollView)
        contentView.addSubview(pageControl)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        setConstraints()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            authorAvatarImageView.widthAnchor.constraint(equalToConstant: 30),
            authorAvatarImageView.heightAnchor.constraint(equalToConstant: 30),
            authorAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            authorAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            authorNameLabel.widthAnchor.constraint(equalToConstant: 200),
            authorNameLabel.heightAnchor.constraint(equalToConstant: 30),
            authorNameLabel.leadingAnchor.constraint(equalTo: authorAvatarImageView.trailingAnchor, constant: 6),
            authorNameLabel.centerYAnchor.constraint(equalTo: authorAvatarImageView.centerYAnchor),

            actionsButton.widthAnchor.constraint(equalToConstant: 24),
            actionsButton.heightAnchor.constraint(equalToConstant: 24),
            actionsButton.centerYAnchor.constraint(equalTo: authorAvatarImageView.centerYAnchor),
            actionsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: authorAvatarImageView.bottomAnchor, constant: 10),
            scrollView.heightAnchor.constraint(equalToConstant: 239),

            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 18),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            likeButton.widthAnchor.constraint(equalToConstant: 24),
            likeButton.heightAnchor.constraint(equalToConstant: 24),
            likeButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 8),
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),

            commentsButton.widthAnchor.constraint(equalToConstant: 24),
            commentsButton.heightAnchor.constraint(equalToConstant: 24),
            commentsButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            commentsButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),

            shareButton.widthAnchor.constraint(equalToConstant: 24),
            shareButton.heightAnchor.constraint(equalToConstant: 24),
            shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            shareButton.leadingAnchor.constraint(equalTo: commentsButton.trailingAnchor, constant: 8),

            bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 24),
            bookmarkButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),

            likesLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),
            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            likesLabel.widthAnchor.constraint(equalToConstant: 107),
            likesLabel.heightAnchor.constraint(equalToConstant: 15),

            postText.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 6),
            postText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            postText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            postText.heightAnchor.constraint(equalToConstant: 30),

            myAvatar.widthAnchor.constraint(equalToConstant: 20),
            myAvatar.heightAnchor.constraint(equalToConstant: 20),
            myAvatar.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 6),
            myAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),

            commentTextField.centerYAnchor.constraint(equalTo: myAvatar.centerYAnchor),
            commentTextField.leadingAnchor.constraint(equalTo: myAvatar.trailingAnchor, constant: 3),
            commentTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            commentTextField.heightAnchor.constraint(equalToConstant: 15),

            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            timeLabel.topAnchor.constraint(equalTo: myAvatar.bottomAnchor, constant: 4),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            timeLabel.heightAnchor.constraint(equalToConstant: 15),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }

    private func configurateScrollView() {
        scrollView.showsHorizontalScrollIndicator = false

        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(postImages.count), height: 239)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self

        for (index, image) in postImages.enumerated() {
            addImage(image: image, position: CGFloat(index))
        }

        pageControl.numberOfPages = postImages.count
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
    }

    private func addImage(image: UIImage, position: CGFloat) {
        let imageView = UIImageView()
        imageView.image = image
        scrollView.addSubview(imageView)
        let screenWidth = UIScreen.main.bounds.width
        imageView.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: 239)
    }

    @objc private func actionsButtonTapped() {}

    @objc private func likeButtonTapped() {}

    @objc private func commentsButtonTapped() {}

    @objc private func shareButtonTapped() {}

    @objc private func bookmarkButtonTapped() {}
}

// MARK: - PostTableViewCell + UIScrollViewDelegate

extension PostTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
