// AddPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран добавления новой персоны в список
final class AddPersonViewController:
    UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    // MARK: - Constants

    private let userImageView = UIImageView()
    private let changePhotoButton = UIButton()

    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let nameSeparator = UIView()

    private let birthdayLabel = UILabel()
    private let birthdayTextField = UITextField()
    private let birthdaySeparator = UIView()

    private let ageLabel = UILabel()
    private let ageTextField = UITextField()
    private let ageSeparator = UIView()

    private let genderLabel = UILabel()
    private let genderTextField = UITextField()
    private let genderSeparator = UIView()

    private let telegramLabel = UILabel()
    private let telegramTextField = UITextField()
    private let telegramSeparator = UIView()

    private let ages = Array(1 ... 100)
    private let genders = ["Male", "Female"]

    private let agePickerView = UIPickerView()
    private let genderPickerView = UIPickerView()
    private let birthdayDatePicker = UIDatePicker()

    private let toolbar = UIToolbar()

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()
        addViews()
        setupView()
        pickersSetup()
        setupPickerToolbar()
    }

    // MARK: - Public Methods

    /// Количество компонентов пикера
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    /// Количество элементов в каждом компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.isEqual(agePickerView) {
            return ages.count
        } else if pickerView.isEqual(genderPickerView) {
            return genders.count
        } else {
            return 0
        }
    }

    /// Текст для каждой строки в пикере
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.isEqual(agePickerView) {
            return "\(ages[row])"
        } else if pickerView.isEqual(genderPickerView) {
            return genders[row]
        } else {
            return nil
        }
    }

    /// Обработка выбора элемента из пикера
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.isEqual(agePickerView) {
            ageTextField.text = "\(ages[row])"
        } else if pickerView.isEqual(genderPickerView) {
            genderTextField.text = genders[row]
        }
    }

    /// Метод делегата UITextFieldDelegate, вызываемый при нажатии на текстовое поле
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == telegramTextField {
            showTelegramAlert()
            return false
        }
        return true
    }

    // MARK: - Private Methods

    private func setupPickerToolbar() {
        let doneButton = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(okButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbar.sizeToFit()
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
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

        nameSeparator.frame = CGRect(x: 20, y: 293, width: 335, height: 1)
        nameSeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        birthdayLabel.text = "Birthday"
        birthdayLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        birthdayLabel.frame = CGRect(x: 20, y: 314, width: 175, height: 20)

        birthdayTextField.frame = CGRect(x: 20, y: 343, width: 250, height: 17)
        birthdayTextField.placeholder = "Typing Date of Birth"
        birthdayTextField.borderStyle = .none
        birthdayTextField.inputView = birthdayDatePicker
        birthdayTextField.delegate = self

        birthdaySeparator.frame = CGRect(x: 20, y: 368, width: 335, height: 1)
        birthdaySeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        ageLabel.text = "Age"
        ageLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        ageLabel.frame = CGRect(x: 20, y: 389, width: 175, height: 20)

        ageTextField.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        ageTextField.placeholder = "Typing Age"
        ageTextField.borderStyle = .none
        ageTextField.inputView = agePickerView
        ageTextField.delegate = self
        ageTextField.inputAccessoryView = toolbar

        ageSeparator.frame = CGRect(x: 20, y: 443, width: 335, height: 1)
        ageSeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        genderLabel.text = "Gender"
        genderLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        genderLabel.frame = CGRect(x: 20, y: 462, width: 175, height: 20)

        genderTextField.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        genderTextField.placeholder = "Indicate Gender"
        genderTextField.borderStyle = .none
        genderTextField.inputView = genderPickerView
        genderTextField.delegate = self
        genderTextField.inputAccessoryView = toolbar

        genderSeparator.frame = CGRect(x: 20, y: 516, width: 335, height: 1)
        genderSeparator.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        telegramLabel.text = "Telegram"
        telegramLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        telegramLabel.frame = CGRect(x: 20, y: 537, width: 175, height: 20)

        telegramTextField.frame = CGRect(x: 20, y: 566, width: 250, height: 17)
        telegramTextField.placeholder = "Typing Telegram"
        telegramTextField.borderStyle = .none
        telegramTextField.delegate = self

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

    private func pickersSetup() {
        agePickerView.delegate = self
        agePickerView.dataSource = self
        agePickerView.backgroundColor = .white

        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.backgroundColor = .white

        birthdayDatePicker.datePickerMode = .date
        birthdayDatePicker.backgroundColor = .white
        birthdayDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }

    private func showTelegramAlert() {
        let alertController = UIAlertController(
            title: "Please enter Telegram",
            message: nil,
            preferredStyle: .alert
        )

        alertController.addTextField { textField in
            textField.placeholder = "Telegram"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let textField = alertController.textFields?.first, let telegram = textField.text {
                self.telegramTextField.text = telegram
            }
        }
        alertController.addAction(okAction)
        alertController.preferredAction = okAction
        present(alertController, animated: true, completion: nil)
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func addButtonTapped() {}

    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        birthdayTextField.text = dateFormatter.string(from: birthdayDatePicker.date)
    }

    @objc private func okButtonTapped() {
        ageTextField.resignFirstResponder()
        genderTextField.resignFirstResponder()
    }
}
