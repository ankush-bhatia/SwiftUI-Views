//
//  ViewType.swift
//  SwiftUIViewsExample
//
//  Created by Ankush Bhatia on 08/09/20.
//

import Foundation

enum ViewType: String, CaseIterable, Identifiable {

    var id: String {
        self.rawValue
    }
    
    case button = "Buttons"
    case alert = "Alert"
    case menu = "Menu"
}
