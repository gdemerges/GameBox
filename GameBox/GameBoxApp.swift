//
//  GameBoxApp.swift
//  GameBox
//
//  Created by Guillaume Demergès on 04/07/2024.
//

import SwiftData
import SwiftUI

@main
struct GameBoxApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Game.self)
    }
}
