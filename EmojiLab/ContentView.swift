//
//  ContentView.swift
//  EmojiLab
//
//  Created by liuyitian on 11/15/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = GameViewModel()
  var body: some View {
    let a = viewModel.emojiStatus != EmojiSearch.gameOver && (viewModel.showNext || viewModel.emojiStatus == EmojiSearch.found)
    if a {
      ZStack {
        Button(action: {viewModel.startSearch()}){
          Text("Next")
        }
        .frame(maxWidth: 100, maxHeight: 80)
        .font(.title.bold())
        .foregroundColor(.white)
        .background(Color.green)
        .cornerRadius(12)
        VStack{
          Spacer()
          viewModel.emojiResultText()
        }
      }
    } else {
      if viewModel.emojiStatus == EmojiSearch.gameOver{
        VStack {
          Spacer()
          Button(action: {viewModel.restartGame()}){
            Text("GAME OVER\nTap to restart")
          }
          .frame(maxWidth: 120, maxHeight: 80)
          .font(.body)
          .foregroundColor(.white)
          .background(.red)
          .cornerRadius(12)
        }
      } else {
        ZStack { CustomCameraRepresentable(emojiString: emojiObjects[viewModel.currentLevel].emojiName, emojiFound: $viewModel.emojiStatus)
          VStack{
            Spacer()
            VStack {
              Text("\(viewModel.timeRemaining)").onReceive(viewModel.timer) { _ in
                viewModel.adjustTime()}
              .font(.title)
              .fontWeight(.bold)
              .foregroundColor(.yellow)
            }
            viewModel.emojiResultText()
          }
        }
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
