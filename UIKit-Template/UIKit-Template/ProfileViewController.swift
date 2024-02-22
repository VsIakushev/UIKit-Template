// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с данными пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }

    // MARK: - Private Methods

    private func addViews() {
        view.backgroundColor = .white
    }
}
