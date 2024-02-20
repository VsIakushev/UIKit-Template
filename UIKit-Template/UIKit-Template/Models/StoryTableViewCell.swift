// StoryTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class StoryTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func createStories() -> [Author] {
        [
            .init(name: "Lavanda 123", avatar: UIImage.lavanda)
        ]
    }
}
