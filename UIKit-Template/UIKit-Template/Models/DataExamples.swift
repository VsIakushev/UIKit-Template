// DataExamples.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

struct DataExamples {
    static func createStories() -> [Author] {
        [
            .init(name: "Ваша история", avatar: UIImage.myAvatar),
            .init(name: "Lavanda 123", avatar: UIImage.lavanda),
            .init(name: "Lavanda 123", avatar: UIImage.lavanda),
            .init(name: "Lavanda 123", avatar: UIImage.lavanda),
            .init(name: "Lavanda 123", avatar: UIImage.lavanda),
            .init(name: "Lavanda 123", avatar: UIImage.lavanda)
        ]
    }

    static func createRecommendations() -> [Author] {
        [
            Author(name: "crimea_082", avatar: UIImage.crimea),
            Author(name: "mary_pol", avatar: UIImage.girlAtFarm),
            Author(name: "Tours", avatar: UIImage.mountains),
            Author(name: "Hikes", avatar: UIImage.mountains1)
        ]
    }

    static func createPosts() -> [Post] {
        [
            Post(
                author: Author(name: "Bob", avatar: UIImage.lavanda),
                image: UIImage.mountains,
                likes: 15,
                text: "Some post text"
            ),
            Post(
                author: Author(name: "Bob", avatar: UIImage.lavanda),
                image: UIImage.mountains,
                likes: 15,
                text: "Some post text"
            ),
            Post(
                author: Author(name: "Bob", avatar: UIImage.lavanda),
                image: UIImage.mountains,
                likes: 15,
                text: "Some post text"
            ),
            Post(
                author: Author(name: "Bob", avatar: UIImage.lavanda),
                image: UIImage.mountains,
                likes: 15,
                text: "Some post text"
            ),
            Post(
                author: Author(name: "Bob", avatar: UIImage.lavanda),
                image: UIImage.mountains,
                likes: 15,
                text: "Some post text"
            ),
            Post(
                author: Author(name: "Bob", avatar: UIImage.lavanda),
                image: UIImage.mountains,
                likes: 15,
                text: "Some post text"
            )
        ]
    }
}
