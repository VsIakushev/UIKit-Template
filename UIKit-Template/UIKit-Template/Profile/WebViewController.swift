// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

final class WebViewController: UIViewController {
    let webView = WKWebView()

    override func viewDidLoad() {
        setupUI()
        loadRequest()
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
}
