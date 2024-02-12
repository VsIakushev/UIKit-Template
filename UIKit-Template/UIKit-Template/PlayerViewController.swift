// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

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

    var tracks: [TrackInfo] = []
    var activeTrackIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSliders()
        print(activeTrackIndex)
        print(tracks)
    }

    private func setupView() {
        trackImage.image = UIImage(named: "\(tracks[activeTrackIndex].trackImageName)")
        trackNameLabel.text = tracks[activeTrackIndex].trackName
        artistLabel.text = tracks[activeTrackIndex].artist
        durationLabel.text = tracks[activeTrackIndex].dutarion
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

    @IBAction func volumeSliderChanged(_ sender: UISlider) {}

    @IBAction func trackDorationSliderChanged(_ sender: UISlider) {}

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {}

    @IBAction func forwardButtonTapped(_ sender: UIButton) {}

    @IBAction func backwardButtonTapped(_ sender: Any) {}

    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
