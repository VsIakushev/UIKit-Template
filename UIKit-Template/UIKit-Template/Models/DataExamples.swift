// DataExamples.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Имитация работы бэка, возвращает данные для создания ячеек
struct DataExamples {
    static func createProfile() -> Profile {
        Profile(
            userLogin: "mary_rmLink",
            userName: "Мария Иванова",
            avatar: UIImage.profilePhoto,
            description: "Консультант",
            publications: 67,
            subscribers: 458,
            subscriptions: 120,
            link: "www.spacex.com",
            highlights: createHighlights(),
            posts: createPosts(with: 15)
        )
    }

    static func createHighlights() -> [Highlight] {
        []
    }

    static func createPosts(with count: Int) -> [UIImage] {
        let images = [UIImage.image01, UIImage.image02, UIImage.image03, UIImage.image04, UIImage.image05]
        return (0 ..< count).map { _ in images.randomElement()! }
    }

    static func allHighlights() -> [Highlight] {
        [
            .init(image: UIImage.highlight01, title: "Запуск"),
            .init(image: UIImage.highlight02, title: "Луна"),
            .init(image: UIImage.highlight03, title: "Космонавт"),
            .init(image: UIImage.highlight04, title: "Космос"),
            .init(image: UIImage.highlight01, title: "Запуск"),
            .init(image: UIImage.highlight02, title: "Луна")
        ]
    }

    static func createNotificationPosts() -> [NotificationPost] {
        [
            .init(
                author: Author(name: "lavanda123", avatar: UIImage.lavanda),
                postDescription: "Понравился ваш комментарий: \"Очень красиво!\"",
                dateComment: "10ч",
                postPicture: UIImage.mountains
            ),
            .init(
                author: Author(name: "lavanda123", avatar: UIImage.lavanda),
                postDescription: "упомянул(-а) вас в комментарии: @rm Спасибо!",
                dateComment: "11ч",
                postPicture: UIImage.mountains1
            ),
            .init(
                author: Author(name: "lavanda123", avatar: UIImage.lavanda),
                postDescription: "Понравился ваш комментарий: \"Это вы где?\"",
                dateComment: "16ч",
                postPicture: UIImage.crimea
            )
        ]
    }

    static func createNotificationSubscriptions() -> [NotificationSubscription] {
        [
            .init(
                author: Author(name: "12miho", avatar: UIImage.guy),
                postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateComment: "3д",
                isPressed: false
            ),
            .init(
                author: Author(name: "lavanda123", avatar: UIImage.lavanda),
                postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateComment: "5д",
                isPressed: true
            ),
            .init(
                author: Author(name: "crimea_tours", avatar: UIImage.crimea),
                postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateComment: "7д",
                isPressed: false
            ),
        ]
    }

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
                images: [UIImage.mountains1, UIImage.mountains, UIImage.mountains1],
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
