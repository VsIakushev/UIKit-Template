// Post.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель данных необходимых для отображения поста
struct Post {
    let author: Author
    let images: [UIImage]
    let likes: Int
    let text: String
}
