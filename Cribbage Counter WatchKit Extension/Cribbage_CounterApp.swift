//
//  Cribbage_CounterApp.swift
//  Cribbage Counter WatchKit Extension
//
//  Created by Husayn Esmail on 2021-08-05.
//

import SwiftUI

@main
struct Cribbage_CounterApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                GameModeView()
            }
        }
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
    
}

