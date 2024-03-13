//
//  MeetingTimerView.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/13/24.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted})?.name ?? "Anyone"
    }//currentSpeaker
    var body: some View {
        
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay{
                VStack {
                    Text("Placeholder")
                        .font(.title)
                    Text("is speaking")
                }//VStack
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }//overlay
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }//if
                }//ForEach
            }//overlay
            .padding(.horizontal)
    }
}

#Preview {
    var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
    return MeetingTimerView(speakers: speakers, theme: .yellow)
}
