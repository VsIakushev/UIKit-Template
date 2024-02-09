// CafeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран бронирования столика
class CafeViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var fullnameTextField: UITextField!
    @IBOutlet var numberOfGuestsTextField: UITextField!
    @IBOutlet var tableNumberTextField: UITextField!
    @IBOutlet var tableNumberSwitch: UISwitch!
    @IBOutlet var prepaymentSwitch: UISwitch!
    @IBOutlet var vipRoomSwitch: UISwitch!

    // MARK: - IB Actions

    @IBAction func makeCheckPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "toCheckScreen", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(checkAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
