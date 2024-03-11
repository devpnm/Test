//
//  ContentView.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/8/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            
            
            HStack {
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }//HStack
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }//Button
                .accessibilityLabel("Next speaker")
            }//HStack
        }//VStack
        .padding()
    }//body
}//MeetingView

#Preview {
    MeetingView()
}

//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.linearGradient(
//                    colors: [.yellow, .blue],
//                    startPoint: .top,
//                    endPoint: .bottom
//                ))
//            Text("Hello, world!")