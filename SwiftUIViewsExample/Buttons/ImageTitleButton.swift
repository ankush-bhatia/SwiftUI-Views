//
//  ImageTitleButton.swift
//  SwiftUIViewsExample
//
//  Created by Ankush Bhatia on 09/09/20.
//

import SwiftUI

struct ImageTitleButton: View {

    private let cornerRadius: CGFloat = 4.0
    private let buttonPadding: CGFloat = 10.0
    private let minTappableAreaForButton: CGFloat = 24.0

    let width: CGFloat?
    let systemImage: String?
    let customImage: String?
    let title: String
    let enabledTintColor: Color
    let disabledTintColor: Color
    @Binding var isEnabled: Bool
    let buttonAction: () -> Void
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            HStack {
                Spacer()
                Text(title)
                    .font(Font.title)
                imageView
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: getMaxWidth())
            .padding(.all, buttonPadding)
            .foregroundColor(.white)
            .background(tintColor)
            .cornerRadius(cornerRadius)
        })
        .disabled(!isEnabled)
    }

    private func getMaxWidth() -> CGFloat {
        if let width = width {
            return width
        }
        return .infinity
    }

    private var tintColor: Color {
        return isEnabled
            ? enabledTintColor
            : disabledTintColor
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
}

struct ImageTitleButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageTitleButton(width: 250,
                         systemImage: "bell.fill",
                         customImage: nil,
                         title: "Submit",
                         enabledTintColor: .green,
                         disabledTintColor: .gray,
                         isEnabled: .constant(true)) {
            // Button Action
        }
        .previewLayout(.sizeThatFits)
    }
}
