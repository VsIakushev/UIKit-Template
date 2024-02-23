// Post.swift
// Copyright © RoadMap. All rights reserved.

/// Модель данных необходимых для отображения поста
struct Post {
    /// Автор поста
    let author: Author
    /// Изображения поста
    let images: [String]
    /// Количество лайков у поста
    let likes: Int
    /// Текст поста
    let text: String

    /// Создание примеров Постов, имитация работы бэка
    static func createPosts() -> [Post] {
        [
            Post(
                author: Author(name: "tur_v_dagestan", avatar: "mountains"),
                images: ["mountains", "mountains1", "mountains"],
                likes: 201,
                text: "Насладитесь красотой природы. Забронировать тур в дагестан можно уже сейчас!"
            ),
            Post(
                author: Author(name: "hikes_in_dagestan", avatar: "mountains1"),
                images: ["mountains1", "mountains", "mountains1"],
                likes: 188,
                text: "Самые живописные маршруты по горам Кавказа"
            ),
            Post(
                author: Author(name: "Bob", avatar: "lavanda"),
                images: ["mountains"],
                likes: 15,
                text: "Some post text"
            ),
            Post(
                author: Author(name: "Bill", avatar: "guy"),
                images: ["mountains"],
                likes: 25,
                text: "Some another post text"
            ),
            Post(
                author: Author(name: "Derek", avatar: "guyHorses"),
                images: ["mountains"],
                likes: 35,
                text: "And anoter and another post text"
            ),
            Post(
                author: Author(name: "Sam", avatar: "lavanda"),
                images: ["mountains"],
                likes: 15,
                text: "Some post text"
            )
        ]
    }
}
