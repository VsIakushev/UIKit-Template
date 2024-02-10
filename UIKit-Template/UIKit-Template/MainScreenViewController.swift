// MainScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс главного экрана приложения
class MainScreenViewController: UIViewController {
    // MARK: - Private Properties

    private let model = WordReverse()

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        onlyButtonSetupViews()
    }

    // MARK: - Private Methods

    private func createStartButton() -> UIButton {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 335, height: 44)
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)

        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.center = view.center

        return button
    }

    private func onlyButtonSetupViews() {
        let button = createStartButton()
        view.addSubview(button)
    }

    private func createLabels(with word: String) -> [UILabel] {
        let reversedWord = model.reverseWord(word)

        var labels = [UILabel]()

        let labelOne = UILabel()
        labelOne.text = "Вы ввели слово"
        labelOne.font = UIFont(name: "Verdana-Bold", size: 16)
        labelOne.textColor = .black
        labelOne.textAlignment = .center

        let labelTwo = UILabel()
        labelTwo.text = "\(word)"
        labelTwo.font = UIFont(name: "Verdana-Italic", size: 16)
        labelTwo.textColor = .gray
        labelTwo.textAlignment = .center

        let labelThree = UILabel()
        labelThree.text = "А вот что получится, если читать справа налево"
        labelThree.font = UIFont(name: "Verdana-Bold", size: 16)
        labelThree.textColor = .black
        labelThree.numberOfLines = 2
        labelThree.textAlignment = .center

        let labelFour = UILabel()
        labelFour.text = "\(reversedWord)"
        labelFour.font = UIFont(name: "Verdana-Italic", size: 16)
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

        var allViews: [UIView] = labels
        allViews.append(button)

        let labelWidth: CGFloat = 275
        let labelOriginX = (view.frame.size.width - labelWidth) / 2

        labels[0].frame = CGRect(x: labelOriginX, y: 100, width: labelWidth, height: 20)
        labels[1].frame = CGRect(x: labelOriginX, y: labels[0].frame.maxY + 20, width: labelWidth, height: 20)
        labels[2].frame = CGRect(x: labelOriginX, y: labels[1].frame.maxY + 80, width: labelWidth, height: 60)
        labels[3].frame = CGRect(x: labelOriginX, y: labels[2].frame.maxY + 20, width: labelWidth, height: 20)
        button.frame = CGRect(x: (view.frame.width - 335) / 2, y: labels[3].frame.maxY + 202, width: 335, height: 44)

        labels.forEach { view.addSubview($0) }
        view.addSubview(button)
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
        alertController.preferredAction = okAction
        present(alertController, animated: true)
    }
}
