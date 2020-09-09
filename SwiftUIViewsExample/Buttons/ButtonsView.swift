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
            Text("Title Button")
            Text("Image Button")
            Text("ImageTitle Button")
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
                            // Button Action received here
                        })
                .padding(.horizontal)
        } else {
            EmptyView()
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}
