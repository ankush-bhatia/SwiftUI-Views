//
//  ButtonsView.swift
//  SwiftUIViewsExample
//
//  Created by Ankush Bhatia on 09/09/20.
//

import SwiftUI

struct ButtonsView: View {
    
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack {
            buttonsPicker
                .padding(.vertical)
            buttonsView
            Spacer()
        }
    }
    
    private var buttonsPicker: some View {
        Picker("Select Button Type",
               selection: $selectedIndex) {
            Text("Title Button").tag(0)
            Text("Image Button").tag(1)
            Text("ImageTitle Button").tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private var buttonsView: some View {
        if selectedIndex == 0 {
            TitleButton(title: "Submit",
                        enabledBackgroundColor: .green,
                        disabledBackgroundColor: .gray,
                        isEnabled: .constant(true),
                        buttonAction: {
                            // Button Action
                        })
                .padding(.horizontal)
        } else if selectedIndex == 1 {
            ImageButton(systemImage: "bell.fill",
                        customImage: nil,
                        enabledTintColor: .blue,
                        disabledTintColor: .gray,
                        isEnabled: .constant(true)) {
                // Button Action
            }
        } else {
            ImageTitleButton(width: 200,
                             systemImage: "bell.fill",
                             customImage: nil,
                             title: "Subscribe",
                             enabledTintColor: .green,
                             disabledTintColor: .gray,
                             isEnabled: .constant(true)) {
                // Button Action
            }
            .padding(.horizontal)
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
