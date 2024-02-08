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
        setGuessButton()
        setCalculateButton()
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

    private func setGuessButton() {
        let button = UIButton(type: .custom)
        button.setTitle("Угадай \nчисло", for: .normal)
        button.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 82, y: 264, width: 150, height: 150)
        button.backgroundColor = UIColor(named: "ButtonGuess")
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(named: "ButtonGuessBorder")?.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        view.addSubview(button)
    }

    private func setCalculateButton() {
        let button = UIButton(type: .custom)
        button.setTitle("Калькулятор", for: .normal)
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 132, y: 507, width: 200, height: 200)
        button.backgroundColor = UIColor(named: "ButtonCalculate")
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(named: "ButtonCalculateBorder")?.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.textAlignment = .center
        view.addSubview(button)
    }

    @objc private func guessButtonTapped() {
        print("кнопка УГАДАЙ нажата")
    }

    @objc private func calculateButtonTapped() {
        print("кнопка КАЛЬКУЛЯТОР нажата")
    }
}
