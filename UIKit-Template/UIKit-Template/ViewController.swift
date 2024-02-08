// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Основной экран приложения
class ViewController: UIViewController {
    // MARK: - Private Properties

    private let contentView = UIImageView(image: UIImage(named: "Background"))

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.insertSubview(contentView, at: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createGreetingAlert()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setSafeAreaFrame()
    }

    // MARK: - Private Methods

    private func setSafeAreaFrame() {
        contentView.frame = CGRect(
            x: view.safeAreaInsets.left,
            y: view.safeAreaInsets.top,
            width: view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
            height: view.bounds.height - view.safeAreaInsets.top // - view.safeAreaInsets.bottom
        )
    }

    private func setBackground() {
        view.backgroundColor = .white
        view.insertSubview(contentView, at: 0)
    }

    private func setGreetingsLabel(name: String) {
        let greetingsLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 82))
        greetingsLabel.text = "Приветствую, \(name)"
        greetingsLabel.textAlignment = .center
        greetingsLabel.textColor = UIColor.white
        greetingsLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        greetingsLabel.backgroundColor = UIColor(named: "GreetingsBackground")
        greetingsLabel.numberOfLines = 2
        contentView.addSubview(greetingsLabel)
    }

    private func createGreetingAlert() {
        let alert = UIAlertController(title: "Пожалуйста, \nпредставьтесь", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            if let name = alert.textFields?.first?.text {
                self.setGreetingsLabel(name: name)
            }
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
}
