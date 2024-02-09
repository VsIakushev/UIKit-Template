// PersonsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображения Persons, для отслеживания дней до их дня рождения
class PersonsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Второй экран"
        let backButton = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )

        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }

    @objc private func backButtonTapped() {
        // Обработка нажатия на кнопку "Back"
        navigationController?.popViewController(animated: true)
    }

    @objc func addButtonTapped() {
        // Handle add button tap
    }
}
