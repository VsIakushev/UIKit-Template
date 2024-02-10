// AddPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class AddPersonViewController: UIViewController {
    let userImageView = UIImageView()
    let changePhotoButton = UIButton()

    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let nameSeparator = UIView()

    let birthdayLabel = UILabel()
    let birthdayTextField = UITextField()
    let birthdaySeparator = UIView()

    let ageLabel = UILabel()
    let ageTextField = UITextField()
    let ageSeparator = UIView()

    let genderLabel = UILabel()
    let genderTextField = UITextField()
    let genderSeparator = UIView()

    let telegramLabel = UILabel()
    let telegramTextField = UITextField()
    let telegramSeparator = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        addViews()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white

        userImageView.image = UIImage(named: "emptyPhoto")
        userImageView.frame = CGRect(x: 125, y: 66, width: 125, height: 125)

        changePhotoButton.setTitle("Change photo", for: .normal)
        changePhotoButton.frame = CGRect(x: 125, y: 199, width: 125, height: 20)

        nameLabel.text = "Name Surname"
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        nameLabel.frame = CGRect(x: 20, y: 239, width: 175, height: 20)

        nameTextField.frame = CGRect(x: 20, y: 268, width: 250, height: 17)
        nameTextField.placeholder = "Typing Name Surname"
        nameTextField.borderStyle = .none
//        nameTextField.inputView =

        nameSeparator.frame = CGRect(x: 20, y: 293, width: 335, height: 1)
        nameSeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        birthdayLabel.text = "Birthday"
        birthdayLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        birthdayLabel.frame = CGRect(x: 20, y: 314, width: 175, height: 20)

        birthdayTextField.frame = CGRect(x: 20, y: 343, width: 250, height: 17)
        birthdayTextField.placeholder = "Typing Date of Birth"
        birthdayTextField.borderStyle = .none
//        nameTextField.inputView =

        birthdaySeparator.frame = CGRect(x: 20, y: 368, width: 335, height: 1)
        birthdaySeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        ageLabel.text = "Age"
        ageLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        ageLabel.frame = CGRect(x: 20, y: 389, width: 175, height: 20)

        ageTextField.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        ageTextField.placeholder = "Typing Age"
        ageTextField.borderStyle = .none
//        nameTextField.inputView =

        ageSeparator.frame = CGRect(x: 20, y: 443, width: 335, height: 1)
        ageSeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        genderLabel.text = "Gender"
        genderLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        genderLabel.frame = CGRect(x: 20, y: 462, width: 175, height: 20)

        genderTextField.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        genderTextField.placeholder = "Indicate Gender"
        genderTextField.borderStyle = .none
//        nameTextField.inputView =

        genderSeparator.frame = CGRect(x: 20, y: 516, width: 335, height: 1)
        genderSeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        telegramLabel.text = "Telegram"
        telegramLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        telegramLabel.frame = CGRect(x: 20, y: 537, width: 175, height: 20)

        telegramTextField.frame = CGRect(x: 20, y: 566, width: 250, height: 17)
        telegramTextField.placeholder = "Typing Telegram"
        telegramTextField.borderStyle = .none
//        nameTextField.inputView =

        telegramSeparator.frame = CGRect(x: 20, y: 591, width: 335, height: 1)
        telegramSeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)
    }

    private func addViews() {
        view.addSubview(userImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(nameSeparator)
        view.addSubview(birthdayLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(birthdaySeparator)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(ageSeparator)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(genderSeparator)
        view.addSubview(telegramLabel)
        view.addSubview(telegramTextField)
        view.addSubview(telegramSeparator)
    }

    private func navigationBarSetup() {
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        cancelButton.frame = CGRect(x: 20, y: 15, width: 50, height: 20)

        let addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.frame = CGRect(x: 325, y: 15, width: 50, height: 20)

        view.addSubview(cancelButton)
        view.addSubview(addButton)
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func addButtonTapped() {}
}
