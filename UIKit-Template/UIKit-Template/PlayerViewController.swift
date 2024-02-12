// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

class PlayerViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var trackImage: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!

    @IBOutlet var trackDurationSlider: UISlider!
    @IBOutlet var volumeSlider: UISlider!

    // MARK: - Public Properties

    var player = AVAudioPlayer()
    var tracks: [TrackInfo] = []
    var activeTrackIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        print(activeTrackIndex)
        print(tracks)
        setupPlayer()

        trackDurationSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
    }

    private func setupPlayer() {
        trackImage.image = UIImage(named: "\(tracks[activeTrackIndex].trackImageName)")
        trackNameLabel.text = tracks[activeTrackIndex].trackName
        artistLabel.text = tracks[activeTrackIndex].artist
        durationLabel.text = tracks[activeTrackIndex].dutarion

        let address = tracks[activeTrackIndex].address

        print("starting player... address: \(address)")
        do {
            if let audioPath = Bundle.main.path(forResource: address, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                trackDurationSlider.maximumValue = Float(player.duration)
                print("path ok")
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

    @objc func changeSlider(sender: UISlider) {
        if sender.isEqual(trackDurationSlider) {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func volumeSliderChanged(_ sender: UISlider) {
        player.volume = volumeSlider.value
    }

    @IBAction func trackDorationSliderChanged(_ sender: UISlider) {
        player.currentTime = TimeInterval(trackDurationSlider.value)
    }

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        print("play pressed")
        player.play()
    }

    @IBAction func forwardButtonTapped(_ sender: UIButton) {}

    @IBAction func backwardButtonTapped(_ sender: Any) {}

    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
