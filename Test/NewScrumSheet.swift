//
//  NewScrumSheet.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/13/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }//Button
                    }//ToolBarItem
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }//Button
                    }//ToolBarItem
                }//toolbar
        }//NavStack
    }//body
}

#Preview {
    NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
}
