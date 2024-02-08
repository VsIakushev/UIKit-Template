// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс главного экрана приложения
class ViewController: UIViewController {
    let model = WordModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        onlyButtonSetupViews()
    }

    private func createStartButton() -> UIButton {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 335, height: 44)
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "ButtonColor")
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12

        return button
    }

    private func onlyButtonSetupViews() {
        let button = createStartButton()
        button.center = view.center
        view.addSubview(button)
    }

    private func createLabels(with word: String) -> [UILabel] {
        let reversedWord = model.reverseWord(word).capitalized

        var labels = [UILabel]()

        let labelOne = UILabel()
        labelOne.text = "Вы ввели слово"
        labelOne.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        labelOne.textColor = .black
        labelOne.textAlignment = .center

        let labelTwo = UILabel()
        labelTwo.text = "\(word)"
        labelTwo.font = UIFont.italicSystemFont(ofSize: 20)
        labelTwo.textColor = .gray
        labelTwo.textAlignment = .center

        let labelThree = UILabel()
        labelThree.text = "А вот что получится, если читать справа налево"
        labelThree.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        labelThree.textColor = .black
        labelThree.numberOfLines = 2
        labelThree.textAlignment = .center

        let labelFour = UILabel()
        labelFour.text = "\(reversedWord)"
        labelFour.font = UIFont.italicSystemFont(ofSize: 20)
        labelFour.textColor = .gray
        labelFour.textAlignment = .center

        labels.append(labelOne)
        labels.append(labelTwo)
        labels.append(labelThree)
        labels.append(labelFour)

        return labels
    }

    private func labelsAndButtonSetupView(with word: String) {
        let labels = createLabels(with: word)
        let button = createStartButton()
        button.frame.size.height = 80
        var allViews: [UIView] = labels
        allViews.append(button)

        let stackView = UIStackView(arrangedSubviews: allViews)
        stackView.axis = .vertical
        stackView.spacing = 20

        stackView.frame.size.width = 335
        stackView.frame.size.height = 536

        stackView.setCustomSpacing(-40, after: allViews[0])
        stackView.setCustomSpacing(80, after: allViews[1])

        stackView.setCustomSpacing(202, after: allViews[3])

        stackView.center = view.center

        view.addSubview(stackView)
    }

    @objc private func startButtonPressed() {
        print("Button pressed")
        view.subviews.forEach { $0.removeFromSuperview() }

        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let word = alertController.textFields?.first?.text else { return }
            self.labelsAndButtonSetupView(with: word)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            self.onlyButtonSetupViews()
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
