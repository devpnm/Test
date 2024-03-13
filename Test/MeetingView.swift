//
//  ContentView.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/8/24.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }//VStack
            .padding()
        }//ZStack
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            startScrum()
        }//onAppear
        .onDisappear {
            endScrum()
        }//onDisappear
        .navigationBarTitleDisplayMode(.inline)
    }//body

    private func startScrum(){
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }//speakerChangedAction
        scrumTimer.startScrum()
    }//startScrum
    
    private func endScrum(){
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
//        print("New history for \(scrum.title) = \(scrum.history)")
    }//endScrum
}//MeetingView

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}

//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.linearGradient(
//                    colors: [.yellow, .blue],
//                    startPoint: .top,
//                    endPoint: .bottom
//                ))
//            Text("Hello, world!")
