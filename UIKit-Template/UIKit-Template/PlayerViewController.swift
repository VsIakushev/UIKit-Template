// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран АудиоПлеера
final class PlayerViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var trackImage: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!

    @IBOutlet var trackDurationSlider: UISlider!
    @IBOutlet var volumeSlider: UISlider!

    @IBOutlet var playPauseButton: UIButton!

    // MARK: - Public Properties

    var tracks: [TrackInfo] = []
    var activeTrackIndex = 0

    // MARK: - Private Properties

    private var player = AVAudioPlayer()
    private var timer: Timer?

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSliders()
        setupPlayer()
        playPause()

        trackDurationSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
    }

    // MARK: - Private Methods

    private func setupPlayer() {
        trackImage.image = UIImage(named: "\(tracks[activeTrackIndex].trackImageName)")
        trackNameLabel.text = tracks[activeTrackIndex].trackName
        artistLabel.text = tracks[activeTrackIndex].artist

        let address = tracks[activeTrackIndex].address

        do {
            if let audioPath = Bundle.main.path(forResource: address, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                player.prepareToPlay()
                trackDurationSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
    }

    private func setupSliders() {
        /// Поворот слайдера регулировки громкости вертикально
        volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        volumeSlider.frame = CGRect(x: 14, y: 210, width: 15, height: 100)
        volumeSlider.maximumTrackTintColor = .lightGray
        trackDurationSlider.maximumTrackTintColor = .lightGray

        /// Устанавка маленького circle в качестве ползунка для слайдеров
        if let thumbImage = UIImage(systemName: "circlebadge.fill") {
            trackDurationSlider.setThumbImage(thumbImage, for: .normal)
            volumeSlider.setThumbImage(thumbImage, for: .normal)
        }
    }

    private func playPause() {
        if player.isPlaying == false {
            player.play()
            startTimer()
            playPauseButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        } else {
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimeLabelAndDurationSlider),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func updateTimeLabelAndDurationSlider() {
        let currentTime = Int(player.currentTime)
        let minutes = currentTime / 60
        let seconds = currentTime % 60

        let timeString = String(format: "%02d:%02d", minutes, seconds)

        durationLabel.text = timeString
        trackDurationSlider.value = Float(player.currentTime)
    }

    @objc private func changeSlider(sender: UISlider) {
        if sender.isEqual(trackDurationSlider) {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction private func volumeSliderChanged(_ sender: UISlider) {
        player.volume = volumeSlider.value
    }

    @IBAction private func trackDurationSliderChanged(_ sender: UISlider) {
        player.currentTime = TimeInterval(trackDurationSlider.value)
    }

    @IBAction private func playPauseButtonTapped(_ sender: UIButton) {
        playPause()
    }

    @IBAction private func forwardButtonTapped(_ sender: UIButton) {
        let isPlaying = player.isPlaying

        if activeTrackIndex == tracks.count - 1 {
            return
        } else {
            activeTrackIndex += 1
            setupPlayer()
            if isPlaying {
                player.play()
            }
        }
    }

    @IBAction private func backwardButtonTapped(_ sender: Any) {
        let isPlaying = player.isPlaying

        if activeTrackIndex == 0 {
            return
        } else {
            activeTrackIndex -= 1
            setupPlayer()
            if isPlaying {
                player.play()
            }
        }
    }

    @IBAction private func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
