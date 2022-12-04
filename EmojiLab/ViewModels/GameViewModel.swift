//
//  GameViewModel.swift
//  EmojiLab
//
//  Created by liuyitian on 11/15/22.
//

import SwiftUI

class GameViewModel: ObservableObject {
  // MARK: - Properties setup
  @Published var currentLevel = 0
  @Published var showNext = false
  
  // Set up timer for the game
  @Published var timer = Timer.publish (every: 1, on: .main, in: .common).autoconnect()
  @Published var timeRemaining = 10
  
  // Set initial emoji status to searching
  @Published var emojiStatus = EmojiSearch.searching
  
  // MARK: - Timer methods
  func instantiateTimer() {
    self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  }

  func cancelTimer() {
    self.timer.upstream.connect().cancel()
  }
  
  func adjustTime() {
    if self.emojiStatus == .found {
      self.cancelTimer()
      self.timeRemaining = 10
      
    }
    else {
      if self.timeRemaining > 0 {
        self.timeRemaining -= 1
      }
      else{
        self.emojiStatus = .notFound
        self.showNext = true
      }
    }
  }
  
  // MARK: - Gameplay methods
   func startSearch() {
     if self.currentLevel == emojiObjects.count - 1 {
       self.emojiStatus = .gameOver
     }
     else {
       self.currentLevel = self.currentLevel + 1
       startRound()
     }
   }
   
   func restartGame() {
     self.currentLevel = 0
     startRound()
   }
   
   func startRound() {
     self.timeRemaining = 10
     self.emojiStatus = .searching
     self.showNext = false
     self.instantiateTimer()
   }
   
   func emojiResultText() -> Text {
    switch emojiStatus {
    case .found:
     return Text("\(emojiObjects[currentLevel].emoji) is FOUND")
       .font(.system(size:50, design: .rounded))
       .fontWeight(.bold)
    case .notFound:
       return Text("\(emojiObjects[currentLevel].emoji) NOT FOUND")
       .font(.system(size:50, design: .rounded))
       .foregroundColor(.red)
       .fontWeight(.bold)
    default:
       return Text(emojiObjects[currentLevel].emoji)
       .font(.system(size:50, design: .rounded))
       .fontWeight(.bold)
     }
   }
}

