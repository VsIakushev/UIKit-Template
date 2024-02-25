// TrafficLightUsingStackView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора созданного с помощью StackView
final class TrafficLightUsingStackView: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static var lightWidth = 110
        static let backgroundWithToHeightRatio = 0.4255
        static let colorViewToBackgroundWithRatio = 0.6875
    }

    // MARK: - Visual COmponents

    private let backgroundView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.8
        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.distribution = .fillEqually
        stackView.spacing = 8

        return stackView
    }()

    private let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    // MARK: - Private Properties

    private var lightWidth: CGFloat = 0
    private var lightHeight: CGFloat = 0
    private var backgroundHeight: CGFloat = 0
    private var backgroundWidth: CGFloat = 0
    private var lightCornerRadous: CGFloat = 0

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        calcUlateSize(widthOfLight: 110)
        setupUI()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        // Проверяем новую ориентацию экрана
        if size.width > size.height {
            calcUlateSize(widthOfLight: 100)
            setupUI()
        } else {
            calcUlateSize(widthOfLight: 110)
            setupUI()
        }
    }

    // MARK: - Private Methods

    private func calcUlateSize(widthOfLight: CGFloat) {
        lightWidth = widthOfLight
        lightHeight = widthOfLight
        backgroundWidth = CGFloat(Double(lightWidth) / Constants.colorViewToBackgroundWithRatio)
        backgroundHeight = CGFloat(Double(backgroundWidth) / Constants.backgroundWithToHeightRatio)
        lightCornerRadous = widthOfLight / 2
    }

    private func addViews() {
        view.addSubview(stackView)
        view.addSubview(backgroundView)
        backgroundView.addSubview(stackView)
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)
    }

    private func setupUI() {
        view.backgroundColor = .white

        redView.layer.cornerRadius = lightCornerRadous
        yellowView.layer.cornerRadius = lightCornerRadous
        greenView.layer.cornerRadius = lightCornerRadous

        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: backgroundHeight),
            backgroundView.widthAnchor.constraint(equalToConstant: backgroundWidth),

            stackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: lightWidth),
            stackView.heightAnchor.constraint(equalToConstant: lightHeight * 3 + 16),
            redView.widthAnchor.constraint(equalToConstant: lightWidth),
            redView.heightAnchor.constraint(equalToConstant: lightHeight),
            yellowView.widthAnchor.constraint(equalToConstant: 110),
            yellowView.heightAnchor.constraint(equalToConstant: 110),
            greenView.widthAnchor.constraint(equalToConstant: 110),
            greenView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}
