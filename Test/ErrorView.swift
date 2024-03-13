//
//  ErrorView.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/13/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occured!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }//VStack
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss"){
                        dismiss()
                    }//Button
                }//ToolbarItem
            }//toolbar
        }//NavStack
    }//body
}

#Preview {
    enum SampleError: Error {
        case errorRequired
    }//Sample Error
    
    var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired, guidance:"Ignore this")
    }//wrapper
    
    return ErrorView(errorWrapper: wrapper)
}
