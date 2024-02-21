// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class PostTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let boldFont = UIFont(name: "Verdana-Bold", size: 10)
        static let regularFont = UIFont(name: "Verdana", size: 10)
        static let commentPlaceholder = "Комментировать ..."
        static let myAvatar = UIImage.myAvatar
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

    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)

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

    private var postImages = [UIImage]()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(with post: Post) {
        authorAvatarImageView.image = post.author.avatar
        authorNameLabel.text = post.author.name
        timeLabel.text = Constants.timeAgo
        postImages = post.images

        likesLabel.text = "Нравится: \(post.likes)"
        likesLabel.textColor = .black
        likesLabel.font = Constants.boldFont
        postText.text = post.text
        myAvatar.image = UIImage.myAvatar

        setupPageViewController()
    }

    // MARK: - Private Methods

    private func setupPageViewController() {
        guard !postImages.isEmpty else { return }
        let imagesViewControllers = postImages.map { image -> UIViewController in
            let vc = UIViewController()
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: image.size.height)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true

            vc.view.addSubview(imageView)
            return vc
        }

        let firstImageViewController = imagesViewControllers[0]
        pageViewController
            .setViewControllers([firstImageViewController], direction: .forward, animated: true) { [weak self] _ in
                self?.updatePageViewControllerHeight()
            }
    }

    private func updatePageViewControllerHeight() {
        guard let firstImageViewController = pageViewController.viewControllers?.first,
              let imageView = firstImageViewController.view.subviews.first as? UIImageView else { return }

        // Обновление высоты pageViewController в соответствии с размером изображения
        let imageHeight = imageView.frame.height
        pageViewController.view.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
    }

    private func setupUI() {
        addSubview(authorAvatarImageView)
        addSubview(authorNameLabel)
        addSubview(actionsButton)
        addSubview(pageViewController.view)
        addSubview(likeButton)
        addSubview(commentsButton)
        addSubview(shareButton)
        addSubview(bookmarkButton)
        addSubview(likesLabel)
        addSubview(postText)
        addSubview(myAvatar)
        addSubview(commentTextField)
        addSubview(timeLabel)

        authorAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        actionsButton.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        postText.translatesAutoresizingMaskIntoConstraints = false
        myAvatar.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false

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

            pageViewController.view.topAnchor.constraint(equalTo: authorAvatarImageView.bottomAnchor, constant: 10),
            pageViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: likeButton.topAnchor, constant: -12),

            likeButton.widthAnchor.constraint(equalToConstant: 24),
            likeButton.heightAnchor.constraint(equalToConstant: 24),
            likeButton.topAnchor.constraint(equalTo: pageViewController.view.bottomAnchor, constant: 8),
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
            postText.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20),

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

    @objc private func actionsButtonTapped() {}

    @objc private func likeButtonTapped() {}

    @objc private func commentsButtonTapped() {}

    @objc private func shareButtonTapped() {}

    @objc private func bookmarkButtonTapped() {}
}
