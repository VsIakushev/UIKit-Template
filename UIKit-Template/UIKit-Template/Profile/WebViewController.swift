// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран Веб-Браузера
final class WebViewController: UIViewController {
    // MARK: - Visual Components

    private let webView = WKWebView()

    private let toolbar = UIToolbar()
    private let backButtonItem = UIBarButtonItem(systemItem: .rewind)
    private let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
    private let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
    private let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)

    // MARK: - Life Cycles

    override func viewDidLoad() {
        setupUI()
        setupToolbar()
        loadRequest()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }

    private func setupToolbar() {
        view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.items = [backButtonItem, forwardButtonItem, spacer, refreshButtonItem]

        NSLayoutConstraint.activate([
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            toolbar.topAnchor.constraint(equalTo: webView.bottomAnchor)
        ])

        backButtonItem.action = #selector(backAction)
        forwardButtonItem.action = #selector(forwardAction)
        refreshButtonItem.action = #selector(refreshAction)
        webView.navigationDelegate = self
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc func backAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }

    @objc func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }

    @objc func refreshAction() {
        webView.reload()
    }
}

// MARK: - WebViewController + WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButtonItem.isEnabled = webView.canGoBack
        forwardButtonItem.isEnabled = webView.canGoForward
    }
}
