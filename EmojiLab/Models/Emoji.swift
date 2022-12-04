//
//  Emoji.swift
//  EmojiLab
//
//  Created by liuyitian on 11/15/22.
//

import Foundation

protocol EmojiFoundDelegate {
  func emojiWasFound(result: Bool)
}


enum EmojiSearch {
  case found
  case notFound
  case searching
  case gameOver
}


struct EmojiModel {
  var emoji: String
  var emojiName: String
}


let emojiObjects = [EmojiModel(emoji: "💻", emojiName: "laptop"),
                    EmojiModel(emoji: "🐱", emojiName: "cat"),
                    EmojiModel(emoji: "📕", emojiName: "book"),
                    EmojiModel(emoji: "🙎🏻‍♂️", emojiName: "boy"),
                    EmojiModel(emoji: "👁", emojiName: "eyes")]

