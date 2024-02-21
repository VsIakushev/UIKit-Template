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
                author: Author(name: "tur_v_dagestan", avatar: UIImage.mountains),
                images: [UIImage.mountains, UIImage.mountains1, UIImage.mountains],
                likes: 201,
                text: "Насладитесь красотой природы. Забронировать тур в дагестан можно уже сейчас!"
            ),
            Post(
                author: Author(name: "hikes_in_dagestan", avatar: UIImage.mountains1),
                images: [UIImage.mountains1, UIImage.mountains],
                likes: 188,
                text: "Самые живописные маршруты по горам Кавказа"
            ),
            Post(
                author: Author(name: "Bob", avatar: UIImage.lavanda),
                images: [UIImage.mountains],
                likes: 15,
                text: "Some post text"
            ),
            Post(
                author: Author(name: "Bill", avatar: UIImage.guy),
                images: [UIImage.mountains],
                likes: 25,
                text: "Some another post text"
            ),
            Post(
                author: Author(name: "Derek", avatar: UIImage.guyHorses),
                images: [UIImage.mountains],
                likes: 35,
                text: "And anoter and another post text"
            ),
            Post(
                author: Author(name: "Sam", avatar: UIImage.lavanda),
                images: [UIImage.mountains],
                likes: 15,
                text: "Some post text"
            )
        ]
    }
}
