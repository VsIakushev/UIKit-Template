// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white

        let logoImageView = UIImageView()
        logoImageView.frame = CGRect(x: 125, y: 75, width: 125, height: 125)
        logoImageView.image = UIImage(named: "logo")

        let titleLabel = UILabel()
        titleLabel.text = "Birthday Reminder"
        titleLabel.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 18)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = #colorLiteral(red: 0.3535783291, green: 0.2617953122, blue: 0.5807751417, alpha: 1)
        titleLabel.textAlignment = .center

        let signInLabel = UILabel()
        signInLabel.text = "Sign in"
        signInLabel.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        signInLabel.font = UIFont(name: "Verdana-Bold", size: 26)
        signInLabel.textColor = #colorLiteral(red: 0.9119740725, green: 0.2736012042, blue: 0.368863225, alpha: 1)

        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        emailLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        emailLabel.textColor = #colorLiteral(red: 0.9119740725, green: 0.2736012042, blue: 0.368863225, alpha: 1)

        let emailTextField = UITextField()
        emailTextField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        emailTextField.placeholder = "Typing email"
        emailTextField.borderStyle = .none

        let emailSeparatorView = UIView()
        emailSeparatorView.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        emailSeparatorView.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        passwordLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        passwordLabel.textColor = #colorLiteral(red: 0.9119740725, green: 0.2736012042, blue: 0.368863225, alpha: 1)

        let passwordTextField = UITextField()
        passwordTextField.frame = CGRect(x: 20, y: 422, width: 175, height: 17)
        passwordTextField.placeholder = "Typing password"
        passwordTextField.borderStyle = .none

        let passwordSeparatorView = UIView()
        passwordSeparatorView.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        passwordSeparatorView.backgroundColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)

        let showPasswordButton = UIButton()
        showPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        showPasswordButton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        showPasswordButton.tintColor = #colorLiteral(red: 0.5920953751, green: 0.6349814534, blue: 0.6911183596, alpha: 1)
        showPasswordButton.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)

        let loginButton = UIButton()
        loginButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.9652497172, green: 0.7091785073, blue: 0.7500941157, alpha: 1)
        loginButton.layer.cornerRadius = 12

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
    }

    @objc private func showPasswordButtonTapped() {}
}
