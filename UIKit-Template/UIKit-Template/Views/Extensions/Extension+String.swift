// Extension+String.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширенние для изменения шрифта и цвета части строки
extension String {
    func configureDescriptionsFormat(
        nameString: String,
        descriptionString: String,
        dateString: String
    ) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()

        let boldText = nameString
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Verdana-bold", size: 12) ?? UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.black
        ]
        let boldAttributedString = NSAttributedString(string: boldText, attributes: boldAttributes)
        attributedString.append(boldAttributedString)

        let separator = " "
        let separatorAttributedString = NSAttributedString(string: separator)
        attributedString.append(separatorAttributedString)

        let regularText = descriptionString
        let regularAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Verdana", size: 12) ?? UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.black
        ]
        let regularAttributedString = NSAttributedString(string: regularText, attributes: regularAttributes)
        attributedString.append(regularAttributedString)

        attributedString.append(separatorAttributedString)

        let grayText = dateString
        let grayAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Verdana", size: 12) ?? UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.gray
        ]
        let grayAttributedString = NSAttributedString(string: grayText, attributes: grayAttributes)
        attributedString.append(grayAttributedString)

        return attributedString
    }
}
