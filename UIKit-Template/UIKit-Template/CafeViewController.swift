// CafeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран бронирования столика
final class CafeViewController: UIViewController {
    // MARK: - Private Properties

    let segueIdentifierToCheckScreen = "toCheckScreen"

    // MARK: - IB Outlets

    @IBOutlet private var fullnameTextField: UITextField!
    @IBOutlet private var numberOfGuestsTextField: UITextField!
    @IBOutlet private var tableNumberTextField: UITextField!
    @IBOutlet private var tableNumberSwitch: UISwitch!
    @IBOutlet private var prepaymentSwitch: UISwitch!
    @IBOutlet private var vipRoomSwitch: UISwitch!

    // MARK: - IB Actions

    @IBAction private func makeCheckPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: self.segueIdentifierToCheckScreen, sender: self)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(checkAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
