//
//  Theme.swift
//  Test
//
//  Created by Nicolas Makovnik on 3/10/24.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }//accentColor
    var mainColor: Color {
        Color(rawValue)
    }//mainColor
    var name: String{
        rawValue.capitalized
    }//name
    var id: String{
        name
    }//id
}//Theme
