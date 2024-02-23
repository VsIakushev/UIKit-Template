// Profile.swift
// Copyright © RoadMap. All rights reserved.

/// Данные пользователя
struct Profile {
    /// Логин пользователя
    let userLogin: String
    /// Имя и фамилия пользователя
    let userName: String
    /// Название изображения аватара
    let avatar: String
    /// Текст "О себе" на странице профиля
    let description: String
    /// Количество постов пользователя
    let publicationsQuantity: Int
    /// Количество подписчиков пользователя
    let subscribersQuantity: Int
    /// Количество подписок пользователя
    let subscriptionsQuantity: Int
    /// Ссылка в профиле пользователя
    let link: String

    /// Обложки Хайлайтов (сохраненных историй) пользователя
    let highlights: [Highlight]
    /// Обложки постов пользователя
    let posts: [String]

    /// Функция создания примера профиля
    static func createProfile() -> Profile {
        Profile(
            userLogin: "mary_rmLink",
            userName: "Мария Иванова",
            avatar: "profilePhoto",
            description: "Консультант",
            publicationsQuantity: 67,
            subscribersQuantity: 458,
            subscriptionsQuantity: 120,
            link: "www.spacex.com",
            highlights: Highlight.createHighlights(),
            posts: createPosts(with: 15)
        )
    }

    /// Функция создания списка обложек постов для наполнения профиля
    static func createPosts(with count: Int) -> [String] {
        let images = ["image01", "image02", "image03", "image04", "image05"]
        return (0 ..< count).map { _ in images.randomElement()! }
    }
}
