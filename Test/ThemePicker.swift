//
//  ThemePicker.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/11/24.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }//ForEach
        }//Picker
        .pickerStyle(.navigationLink)
    }//body
}//View

#Preview {
    ThemePicker(selection: .constant(.periwinkle))
}
