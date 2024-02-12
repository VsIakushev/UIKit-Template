// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class PlaylistViewController: UIViewController {
    let tracks = [
        TrackInfo(
            trackName: "Let It Be",
            artist: "The Beatles",
            trackImageName: "letItBe",
            dutarion: "04:03",
            address: "lovely"
        ),
        TrackInfo(
            trackName: "Yesterday",
            artist: "The Beatles",
            trackImageName: "yesterday",
            dutarion: "02:05",
            address: "nightCity"
        ),
        TrackInfo(
            trackName: "The Show Must Go On",
            artist: "Queen",
            trackImageName: "showMustGoOn",
            dutarion: "04:31",
            address: "noTimeForCaution"
        )
    ]

    private func pushDataToPlayerViewController(trackIndex: Int) {
        let playerVC = PlayerViewController()
        playerVC.tracks = tracks
        playerVC.activeTrackIndex = trackIndex
    }

    @IBAction func trackButtonTapped(_ sender: UIButton) {
//        let playerVC = PlayerViewController()
//        playerVC.tracks = tracks
//
//        var activeTrack = 0
//        switch sender.titleLabel?.text {
//        case "Let it be": activeTrack = 0
//        case "Yesterday": activeTrack = 1
//        case "The Show Must Go On": activeTrack = 2
//        default: break
//        }
//
//        playerVC.activeTrackIndex = activeTrack
//
//        navigationController?.pushViewController(playerVC, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Проверяем, что идентификатор перехода совпадает с тем, который вы указали в Interface Builder
        var activeTrack = 0
        if let button = sender as? UIButton {
            switch button.titleLabel?.text {
            case "Let it be": activeTrack = 0
            case "Yesterday": activeTrack = 1
            case "The Show Must Go On": activeTrack = 2
            default: break
            }
        }

        if segue.identifier == "toPlayerViewController" {
            // Получаем ссылку на экран, на который происходит переход
            if let destinationVC = segue.destination as? PlayerViewController {
                // Передаем массив треков на второй экран
                destinationVC.tracks = tracks
                destinationVC.activeTrackIndex = activeTrack
            }
        }
    }
}
