//
//  TestApp.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/8/24.
//

import SwiftUI

@main
struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
//            TabView {
//                MeetingView()
//                    .tabItem {
//                        Label("Journal", systemImage: "book")
//                    }
//            }
        }
    }
}
