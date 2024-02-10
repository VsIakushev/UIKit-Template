// WordReverse.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс модели изменения слова
final class WordReverse {
    func reverseWord(_ word: String) -> String {
        String(word.reversed()).capitalized
    }
}
