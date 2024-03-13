//
//  DetailEditView.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/11/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    HStack {
                        Text(attendee.name)
                        Spacer()
//                        Button(action: {
//                            delete()
//                        }) {
//                            Image(systemName:"minus.circle.fill")
//                                .foregroundColor(.red)
//                        }//Button
                    }//HStack
                }//ForEach
                .onDelete { indices in
                    withAnimation {
                        scrum.attendees.remove(atOffsets: indices)
                    }//withAnimation
                }//onDelete
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }//Section
        }//Form
    }//body
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
