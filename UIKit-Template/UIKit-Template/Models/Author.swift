// Author.swift
// Copyright © RoadMap. All rights reserved.

/// Информация о пользователе, авторе постов и сторис
struct Author {
    /// Имя автора поста или сторис
    let name: String
    /// Аватар автора поста или сторис
    let avatar: String

    /// Создание примеров Сторис, имитация работы бэка
    static func createStories() -> [Author] {
        [
            .init(name: "Ваша история", avatar: "profilePhoto"),
            .init(name: "Lavanda 123", avatar: "lavanda"),
            .init(name: "Lavanda 123", avatar: "lavanda"),
            .init(name: "Lavanda 123", avatar: "lavanda"),
            .init(name: "Lavanda 123", avatar: "lavanda"),
            .init(name: "Lavanda 123", avatar: "lavanda")
        ]
    }

    /// Создание примеров Рекоммендаций авторов, имитация работы бэка
    static func createRecommendations() -> [Author] {
        [
            Author(name: "crimea_082", avatar: "crimea"),
            Author(name: "mary_pol", avatar: "girlAtFarm"),
            Author(name: "Tours", avatar: "mountains"),
            Author(name: "Hikes", avatar: "mountains1")
        ]
    }
}
