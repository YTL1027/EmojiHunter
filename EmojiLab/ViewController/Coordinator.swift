//
//  Coordinator.swift
//  EmojiLab
//
//  Created by liuyitian on 11/15/22.
//

import Foundation
import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, EmojiFoundDelegate {
  
    @Binding var emojiFound: EmojiSearch
  
    init(emojiFound: Binding<EmojiSearch>) {
      _emojiFound = emojiFound
    }
  
    func emojiWasFound(result: Bool) {
      print("emojiWasFound \(result)")
      emojiFound = .found
    }
}
