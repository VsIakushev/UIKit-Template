// PersonsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран отображения Persons, для отслеживания дней до их дня рождения
final class PersonsViewController: UIViewController {
    private let persons: [Person] = [
        Person(name: "Helena Link", image: "helena", birthday: "10.03 - turns 25!"),
        Person(name: "Verona Tusk", image: "verona", birthday: "20.03 - turns 39"),
        Person(name: "Alex Smith", image: "alex", birthday: "21.04 - turns 51"),
        Person(name: "Tom Jonson", image: "tom", birthday: "05.06 - turns 18")
    ]

    private let personOneImageView = UIImageView()
    private let personTwoImageView = UIImageView()
    private let personThreeImageView = UIImageView()
    private let personFourImageView = UIImageView()

    private let personOneNameLabel = UILabel()
    private let personTwoNameLabel = UILabel()
    private let personThreeNameLabel = UILabel()
    private let personFourNameLabel = UILabel()

    private let personOneBirthdayLabel = UILabel()
    private let personTwoBirthdayLabel = UILabel()
    private let personThreeBirthdayLabel = UILabel()
    private let personFourBirthdayLabel = UILabel()

    private let personOneDaysBeforeBirthday = UIImageView()
    private let personTwoDaysBeforeBirthday = UILabel()
    private let personThreeDaysBeforeBirthday = UILabel()
    private let personFourDaysBeforeBirthday = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup()

        setupView()
        addViews()
    }

    private func navigationBarSetup() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Birthday Reminder"
        let backButton = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )

        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
    }

    private func setupView() {
        view.backgroundColor = .white

        personOneImageView.image = UIImage(named: persons[0].image)
        personOneImageView.frame = CGRect(x: 19, y: 105, width: 75, height: 75)

        personOneNameLabel.text = persons[0].name
        personOneNameLabel.frame = CGRect(x: 102, y: 119, width: 209, height: 20)
        personOneNameLabel.font = UIFont(name: "Verdana-Bold", size: 16)

        personOneBirthdayLabel.text = persons[0].birthday
        personOneBirthdayLabel.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        personOneBirthdayLabel.font = UIFont(name: "Verdana", size: 14)

        personOneDaysBeforeBirthday.image = UIImage(named: "cake")
        personOneDaysBeforeBirthday.frame = CGRect(x: 314, y: 119, width: 44, height: 44)

        personTwoImageView.image = UIImage(named: persons[1].image)
        personTwoImageView.frame = CGRect(x: 19, y: 200, width: 75, height: 75)

        personTwoNameLabel.text = persons[1].name
        personTwoNameLabel.frame = CGRect(x: 102, y: 214, width: 209, height: 20)
        personTwoNameLabel.font = UIFont(name: "Verdana-Bold", size: 16)

        personTwoBirthdayLabel.text = persons[1].birthday
        personTwoBirthdayLabel.frame = CGRect(x: 102, y: 242, width: 209, height: 20)
        personTwoBirthdayLabel.font = UIFont(name: "Verdana", size: 14)

        personTwoDaysBeforeBirthday.text = "10 days"
        personTwoDaysBeforeBirthday.frame = CGRect(x: 315, y: 214, width: 42, height: 44)
        personTwoDaysBeforeBirthday.font = UIFont(name: "Verdana-Bold", size: 16)
        personTwoDaysBeforeBirthday.textColor = #colorLiteral(red: 0.3535783291, green: 0.2617953122, blue: 0.5807751417, alpha: 1)
        personTwoDaysBeforeBirthday.numberOfLines = 2
        personTwoDaysBeforeBirthday.textAlignment = .center

        personThreeImageView.image = UIImage(named: persons[2].image)
        personThreeImageView.frame = CGRect(x: 19, y: 295, width: 75, height: 75)

        personThreeNameLabel.text = persons[2].name
        personThreeNameLabel.frame = CGRect(x: 102, y: 309, width: 209, height: 20)
        personThreeNameLabel.font = UIFont(name: "Verdana-Bold", size: 16)

        personThreeBirthdayLabel.text = persons[2].birthday
        personThreeBirthdayLabel.frame = CGRect(x: 102, y: 337, width: 209, height: 20)
        personThreeBirthdayLabel.font = UIFont(name: "Verdana", size: 14)

        personThreeDaysBeforeBirthday.text = "42 days"
        personThreeDaysBeforeBirthday.frame = CGRect(x: 315, y: 309, width: 42, height: 44)
        personThreeDaysBeforeBirthday.font = UIFont(name: "Verdana-Bold", size: 16)
        personThreeDaysBeforeBirthday.textColor = #colorLiteral(red: 0.3535783291, green: 0.2617953122, blue: 0.5807751417, alpha: 1)
        personThreeDaysBeforeBirthday.numberOfLines = 2
        personThreeDaysBeforeBirthday.textAlignment = .center

        personFourImageView.image = UIImage(named: persons[3].image)
        personFourImageView.frame = CGRect(x: 19, y: 390, width: 75, height: 75)

        personFourNameLabel.text = persons[3].name
        personFourNameLabel.frame = CGRect(x: 102, y: 404, width: 209, height: 20)
        personFourNameLabel.font = UIFont(name: "Verdana-Bold", size: 16)

        personFourBirthdayLabel.text = persons[3].birthday
        personFourBirthdayLabel.frame = CGRect(x: 102, y: 432, width: 209, height: 20)
        personFourBirthdayLabel.font = UIFont(name: "Verdana", size: 14)

        personFourDaysBeforeBirthday.text = "87 days"
        personFourDaysBeforeBirthday.frame = CGRect(x: 315, y: 404, width: 42, height: 44)
        personFourDaysBeforeBirthday.font = UIFont(name: "Verdana-Bold", size: 16)
        personFourDaysBeforeBirthday.textColor = #colorLiteral(red: 0.3535783291, green: 0.2617953122, blue: 0.5807751417, alpha: 1)
        personFourDaysBeforeBirthday.numberOfLines = 2
        personFourDaysBeforeBirthday.textAlignment = .center
    }

    private func addViews() {
        view.addSubview(personOneImageView)
        view.addSubview(personOneNameLabel)
        view.addSubview(personOneBirthdayLabel)
        view.addSubview(personOneDaysBeforeBirthday)

        view.addSubview(personTwoImageView)
        view.addSubview(personTwoNameLabel)
        view.addSubview(personTwoBirthdayLabel)
        view.addSubview(personTwoDaysBeforeBirthday)

        view.addSubview(personThreeImageView)
        view.addSubview(personThreeNameLabel)
        view.addSubview(personThreeBirthdayLabel)
        view.addSubview(personThreeDaysBeforeBirthday)

        view.addSubview(personFourImageView)
        view.addSubview(personFourNameLabel)
        view.addSubview(personFourBirthdayLabel)
        view.addSubview(personFourDaysBeforeBirthday)
    }

    @objc private func backButtonTapped() {
        // Обработка нажатия на кнопку "Back"
        navigationController?.popViewController(animated: true)
    }

    @objc func addButtonTapped() {
        let addPersonViewController = AddPersonViewController()
        addPersonViewController.modalPresentationStyle = .popover
        present(addPersonViewController, animated: true)
    }
}
