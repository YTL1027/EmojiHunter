//
//  EmojiLabApp.swift
//  EmojiLab
//
//  Created by liuyitian on 11/15/22.
//

import SwiftUI

@main
struct EmojiLabApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
