// NotificationSubscription.swift
// Copyright © RoadMap. All rights reserved.

/// Модель для данных, необходимых для уведомления о подписке
struct NotificationSubscription {
    /// Автор, который подписался на пользователя
    let author: Author
    /// Текст уведомления
    let postDescription: String
    /// Количество часов, которое прошло с момента подписки
    let dateComment: String
    /// Нажата ли кнопка подписаться в ответ
    let isPressed: Bool

    /// Создание примеров Уведомлений о подписках, имитация работы бэка
    static func createNotificationSubscriptions() -> [NotificationSubscription] {
        [
            .init(
                author: Author(name: "12miho", avatar: "guy"),
                postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateComment: "3д",
                isPressed: false
            ),
            .init(
                author: Author(name: "lavanda123", avatar: "lavanda"),
                postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateComment: "5д",
                isPressed: true
            ),
            .init(
                author: Author(name: "crimea_tours", avatar: "crimea"),
                postDescription: "появился(-ась) в RMLink. Вы можете быть знакомы",
                dateComment: "7д",
                isPressed: false
            )
        ]
    }
}
