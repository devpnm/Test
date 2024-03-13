//
//  MeetingFooterView.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/13/24.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted }) else { return nil }
        return index + 1
    }//speakerNumber

    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }//isLastSpeaker
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }//speakertext
    
    var body: some View {
        VStack {
            HStack {
                if( isLastSpeaker ){
                    Text("Last Speaker")
                }//if
                else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }//Button
                    .accessibilityLabel("Next speaker")
                }//else
            }//Hstack
        }//VStack
        .padding([.horizontal, .bottom])
    }//body
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
        .previewLayout(.sizeThatFits)
}
