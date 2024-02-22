// Profile.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

struct Profile {
    let userLogin: String
    let userName: String
    let avatar: UIImage
    let description: String
    let publications: Int
    let subscribers: Int
    let subscriptions: Int
    let link: String

    let highlights: [Highlight]
    let posts: [UIImage]
}
