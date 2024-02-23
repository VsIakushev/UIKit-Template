// ProfileHighlightsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ProfileHighlightsTableViewCell: UITableViewCell {
    var highlights = Highlight.createHighlights()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .gray
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
