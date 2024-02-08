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
        guessNumber()
    }

    @objc private func calculateButtonTapped() {
        openCalculator()
    }

    private func openCalculator() {
        let alertController = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Число 1"
            textField.keyboardType = .numberPad
        }
        alertController.addTextField { textField in
            textField.placeholder = "Число 2"
            textField.keyboardType = .numberPad
        }

        let additionAction = UIAlertAction(title: "Сложить            ", style: .default) { _ in
            guard let textField1 = alertController.textFields?.first,
                  let textField2 = alertController.textFields?.last,
                  let number1 = Int(textField1.text ?? ""),
                  let number2 = Int(textField2.text ?? "")
            else {
                return
            }
            let result = number1 + number2
            self.showResult(result)
        }

        let cancelAction = UIAlertAction(title: " Отмена", style: .cancel)

        alertController.addAction(additionAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }

    private func showResult(_ result: Int) {
        let alertController = UIAlertController(title: "Ваш результат", message: "\(result)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            alertController.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }

    private func guessNumber() {
        let alertController = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите число"
            textField.keyboardType = .numberPad
        }

        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let enteredNumber = Int(alertController.textFields?.first?.text ?? "") else {
                print("some error in entered number")
                return
            }
            let randomNumber = Int.random(in: 1 ... 10)
            let title: String
            let message: String

            if enteredNumber == randomNumber {
                title = "Поздравляю"
                message = "Вы угадали"
            } else {
                title = "Упс!"
                message = "Это неверный ответ"
            }
            self.showGuessResult(title: title, message: message)
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true)
    }

    private func showGuessResult(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
