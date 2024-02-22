// NotificationPost.swift
// Copyright © RoadMap. All rights reserved.

/// Модель для данных, необходимых для уведомления о действиях с постом
struct NotificationPost {
    /// Автор поста
    let author: Author
    /// Текст поста
    let postDescription: String
    /// сколько часов произошло событие
    let dateComment: String
    /// Изображение к посту
    let postPicture: String

    /// Создание примеров Уведомлений, имитация работы бэка
    static func createNotificationPosts() -> [NotificationPost] {
        [
            .init(
                author: Author(name: "lavanda123", avatar: "lavanda"),
                postDescription: "Понравился ваш комментарий: \"Очень красиво!\"",
                dateComment: "10ч",
                postPicture: "mountains"
            ),
            .init(
                author: Author(name: "lavanda123", avatar: "lavanda"),
                postDescription: "упомянул(-а) вас в комментарии: @rm Спасибо!",
                dateComment: "11ч",
                postPicture: "mountains1"
            ),
            .init(
                author: Author(name: "lavanda123", avatar: "lavanda"),
                postDescription: "Понравился ваш комментарий: \"Это вы где?\"",
                dateComment: "16ч",
                postPicture: "crimea"
            )
        ]
    }
}
