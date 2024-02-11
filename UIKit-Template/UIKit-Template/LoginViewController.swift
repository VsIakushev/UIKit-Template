// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Логин-экран для входа в приложение
final class LoginViewController: UIViewController {
    // MARK: - Private Properties

    private let logoImageView = UIImageView()
    private let titleLabel = UILabel()
    private let signInLabel = UILabel()
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let emailSeparatorView = UIView()
    private let passwordLabel = UILabel()
    private let passwordTextField = UITextField()
    private let passwordSeparatorView = UIView()
    private let showPasswordButton = UIButton()
    private let loginButton = UIButton()
    private let faceIDLabel = UILabel()
    private let faceIDSwitch = UISwitch()

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addViews()

        checkTextFieldsFiling()

        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    // MARK: - Private Methods

    /// Функция настройки UI элементов
    private func setupView() {
        view.backgroundColor = .white

        logoImageView.frame = CGRect(x: 125, y: 75, width: 125, height: 125)
        logoImageView.image = UIImage(named: "logo")

        titleLabel.text = "Birthday Reminder"
        titleLabel.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 18)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = #colorLiteral(red: 0.3535783291, green: 0.2617953122, blue: 0.5807751417, alpha: 1)
        titleLabel.textAlignment = .center

        signInLabel.text = "Sign in"
        signInLabel.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        signInLabel.font = UIFont(name: "Verdana-Bold", size: 26)
        signInLabel.textColor = #colorLiteral(red: 0.9119740725, green: 0.2736012042, blue: 0.368863225, alpha: 1)

        emailLabel.text = "Email"
        emailLabel.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        emailLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        emailLabel.textColor = #colorLiteral(red: 0.9119740725, green: 0.2736012042, blue: 0.368863225, alpha: 1)

        emailTextField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        emailTextField.placeholder = "Typing email"
        emailTextField.borderStyle = .none
        emailTextField.keyboardType = .emailAddress

        emailSeparatorView.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        emailSeparatorView.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        passwordLabel.text = "Password"
        passwordLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        passwordLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        passwordLabel.textColor = #colorLiteral(red: 0.9119740725, green: 0.2736012042, blue: 0.368863225, alpha: 1)

        passwordTextField.frame = CGRect(x: 20, y: 422, width: 175, height: 17)
        passwordTextField.placeholder = "Typing password"
        passwordTextField.borderStyle = .none
        passwordTextField.isSecureTextEntry = true

        passwordSeparatorView.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        passwordSeparatorView.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        showPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        showPasswordButton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        showPasswordButton.tintColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)
        showPasswordButton.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)

        loginButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.9652497172, green: 0.7091785073, blue: 0.7500941157, alpha: 1)
        loginButton.layer.cornerRadius = 12
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        faceIDLabel.text = "Use FaceID"
        faceIDLabel.frame = CGRect(x: 86, y: 544, width: 150, height: 35)
        faceIDLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        faceIDLabel.textAlignment = .center

        faceIDSwitch.frame = CGRect(x: 248, y: 544, width: 54, height: 35)
        faceIDSwitch.isOn = true
    }

    /// функция добавления UI элементов на экран
    private func addViews() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailSeparatorView)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordSeparatorView)
        view.addSubview(showPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(faceIDLabel)
        view.addSubview(faceIDSwitch)
    }

    /// Функция проверки заполнения текстовых полей емейла и пароля
    private func checkTextFieldsFiling() {
        let userNameText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""

        if userNameText.isEmpty || passwordText.isEmpty {
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.9652497172, green: 0.7091785073, blue: 0.7500941157, alpha: 1)
            faceIDLabel.isHidden = true
            faceIDSwitch.isHidden = true
        } else {
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.9119740725, green: 0.2736012042, blue: 0.368863225, alpha: 1)
            faceIDLabel.isHidden = false
            faceIDSwitch.isHidden = false
        }
    }

    /// Функция отслеживания изменений textField
    @objc private func textFieldDidChange(_ textField: UITextField) {
        checkTextFieldsFiling()
    }

    /// Функция отображения/скрытия textField для ввода пароля
    @objc private func showPasswordButtonTapped() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }

    /// Функция отработки нажатия кнопки Login (перехода на следующий экран)
    @objc private func loginButtonTapped() {
        let personsViewController = PersonsViewController()
        navigationController?.pushViewController(personsViewController, animated: true)
    }
}
