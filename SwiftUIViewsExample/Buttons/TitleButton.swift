//
//  TitleButton.swift
//  SwiftUIViewsExample
//
//  Created by Ankush Bhatia on 09/09/20.
//

import SwiftUI

struct TitleButton: View {
    
    let title: String
    let enabledBackgroundColor: Color
    let disabledBackgroundColor: Color
    @Binding var isEnabled: Bool
    let buttonAction: () -> Void
    
    private let cornerRadius: CGFloat = 4.0
    private let buttonPadding: CGFloat = 10.0
    
    var body: some View {
        Button(action: {
            buttonAction()
        }, label: {
            HStack {
                Spacer()
                Text(title)
                    .font(Font.title)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.all, buttonPadding)
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        })
        .disabled(!isEnabled)
    }
    
    private var backgroundColor: Color {
        return isEnabled ? enabledBackgroundColor : disabledBackgroundColor
    }
}

struct ButttonView_Previews: PreviewProvider {
    static var previews: some View {
        TitleButton(title: "Submit",
                    enabledBackgroundColor: .green,
                    disabledBackgroundColor: .gray,
                    isEnabled: .constant(true),
                    buttonAction: {
                        // Button Action received here
                    })
            .previewLayout(.sizeThatFits)
    }
}
