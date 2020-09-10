//
//  ImageButton.swift
//  SwiftUIViewsExample
//
//  Created by Ankush Bhatia on 09/09/20.
//

import SwiftUI

struct ImageButton: View {

    private let minTappableAreaForButton: CGFloat = 24.0

    let systemImage: String?
    let customImage: String?
    let enabledTintColor: Color
    let disabledTintColor: Color
    @Binding var isEnabled: Bool
    let buttonAction: () -> Void

    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            imageView
        })
        .disabled(!isEnabled)
        .foregroundColor(tintColor)
        .background(Color.clear)
    }

    @ViewBuilder
    private var imageView: some View {
        if let systemImage = systemImage {
            Image(systemName: systemImage)
                .frame(minWidth: minTappableAreaForButton,
                        minHeight: minTappableAreaForButton)
        } else if let customImage = customImage {
            Image(customImage)
                .frame(minWidth: minTappableAreaForButton,
                       minHeight: minTappableAreaForButton)
        }
    }

    private var tintColor: Color {
        return isEnabled ? enabledTintColor : disabledTintColor
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(systemImage: "bell.fill",
                    customImage: nil,
                    enabledTintColor: .green,
                    disabledTintColor: .gray,
                    isEnabled: .constant(true)) {
            // Button Action
        }
        .previewLayout(.sizeThatFits)
    }
}
