// TrafficLightUsingAnchor.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со светофором, сделанным с помощью NSLayoutAnchor
final class TrafficLightUsingAnchor: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let backgroundWithToHeightRatio = 0.4255
        static let colorViewToBackgroundWithRatio = 0.6875
        static let redColor = #colorLiteral(red: 0.8797358871, green: 0.1260137856, blue: 0.1234962419, alpha: 1)
        static let yellowColor = #colorLiteral(red: 0.9682381749, green: 0.7106987834, blue: 0.003238496836, alpha: 1)
        static let greenColor = #colorLiteral(red: 0.4273907542, green: 0.8331491947, blue: 0.0007017497555, alpha: 1)
    }

    // MARK: - Visual Components

    private var backgroundView = UIView()
    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()

    // MARK: - Private Properties

    var cornerRadiusForLights: CGFloat = 50

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Properties

    private func setupUI() {
        view.backgroundColor = .white
        setupLights()
        setupConstraints()
    }

    private func setupLights() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.8
        view.addSubview(backgroundView)

        yellowView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.backgroundColor = Constants.yellowColor
        yellowView.layer.cornerRadius = cornerRadiusForLights

        backgroundView.addSubview(yellowView)

        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = Constants.redColor
        backgroundView.addSubview(redView)
        redView.layer.cornerRadius = cornerRadiusForLights

        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = Constants.greenColor
        backgroundView.addSubview(greenView)
        greenView.layer.cornerRadius = cornerRadiusForLights
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalToConstant: 376),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            yellowView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            yellowView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            yellowView.heightAnchor.constraint(
                equalTo: backgroundView.widthAnchor,
                multiplier: Constants.colorViewToBackgroundWithRatio
            ),
            yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor),

            redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -8),
            redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor),
            redView.heightAnchor.constraint(
                equalTo: yellowView.heightAnchor
            ),
            redView.widthAnchor.constraint(equalTo: yellowView.heightAnchor),

            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 8),
            greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor),
            greenView.heightAnchor.constraint(
                equalTo: yellowView.heightAnchor
            ),
            greenView.widthAnchor.constraint(equalTo: yellowView.heightAnchor)

        ])

        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor, constant: -60),
            backgroundView.widthAnchor.constraint(
                equalTo: backgroundView.heightAnchor,
                multiplier: Constants.backgroundWithToHeightRatio
            )
        ])
        print(yellowView.bounds.width)
    }
}
