// NotificationPost.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Модель для данных, необходимых для уведомления о действиях с постом
struct NotificationPost {
    let author: Author
    let postDescription: String
    let dateComment: String
    let postPicture: UIImage
}
