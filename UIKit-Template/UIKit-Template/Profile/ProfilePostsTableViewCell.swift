// ProfilePostsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ProfilePostsTableViewCell: UITableViewCell {
    var posts = Profile.createPosts(with: 15)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .cyan
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
