//
//  TestApp.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/8/24.
//

import SwiftUI

@main
struct TestApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums){
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    }//do
                    catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Failed to save, try again later, and do not close the app in the meantime")
                    }//catch
                }//Task
            }//saveAction
            .task{
                do{
                    try await store.load()
                }//do
                catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Error loading data. Scrumdinger will load sample data and continue")
                }//catch
            }//task
            .sheet(item: $errorWrapper){
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }//content
//            TabView {
//                MeetingView()
//                    .tabItem {
//                        Label("Journal", systemImage: "book")
//                    }
//            }
        }//WindowGroup
    }
}
