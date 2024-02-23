// Highlights.swift
// Copyright © RoadMap. All rights reserved.

/// Хайлайты (сохраненные Сторис) для отображения в профиле
struct Highlight {
    /// Обложка хайлайта
    let image: String
    /// Название хайлайта
    let title: String

    /// Создание примера хайлайтов для заполнения примера профиля
    static func createHighlights() -> [Highlight] {
        [
            .init(image: "highlight01", title: "Запуск"),
            .init(image: "highlight02", title: "Луна"),
            .init(image: "highlight03", title: "Космонавт"),
            .init(image: "highlight04", title: "Космос"),
            .init(image: "highlight01", title: "Запуск"),
            .init(image: "highlight02", title: "Луна")
        ]
    }
}
