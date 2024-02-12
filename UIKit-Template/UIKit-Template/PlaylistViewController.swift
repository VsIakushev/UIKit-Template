// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class PlaylistViewController: UIViewController {
    let tracks = [
        TrackInfo(
            trackName: "Let It Be",
            artist: "The Beatles",
            trackImageName: "letItBe",
            dutarion: "03:20",
            adress: "lovely"
        ),
        TrackInfo(
            trackName: "Yesterday",
            artist: "The Beatles",
            trackImageName: "yesterday",
            dutarion: "01:50",
            adress: "nightCity"
        ),
        TrackInfo(
            trackName: "The Show Must Go On",
            artist: "Queen",
            trackImageName: "showMustGoOn",
            dutarion: "04:06",
            adress: "noTimeForCaution"
        ),
    ]

    private func pushDataToPlayerViewController(trackIndex: Int) {
        let playerVC = PlayerViewController()
        playerVC.tracks = tracks
        playerVC.activeTrackIndex = trackIndex
    }

//    sender.titleLabel

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
}
