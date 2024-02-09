// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран ввода логина и пароля
class RegistrationViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var showPasswordButton: UIButton!
    @IBOutlet var loginButton: UIButton!

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        checkTextFieldsFiling()

        usernameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    // MARK: - IB Actions

    @IBAction func showPasswordPressed(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {}

    // MARK: - Private Methods

    private func checkTextFieldsFiling() {
        let userNameText = usernameTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""

        if userNameText.isEmpty || passwordText.isEmpty {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(named: "buttonInactive")
        } else {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(named: "buttonActive")
        }
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        checkTextFieldsFiling()
    }
}
