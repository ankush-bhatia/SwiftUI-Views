//
//  ButttonView.swift
//  SwiftUIViewsExample
//
//  Created by Ankush Bhatia on 09/09/20.
//

import SwiftUI

struct TitleButton: View {
    
    let title: String? = nil
    let image: Image? = nil
    
    var body: some View {
        Button(action: {
            
        }, label: {
            if title != nil {
                HStack {
                    Spacer()
                    Text(title!)
                        .font(Font.title)
                    Spacer()
                }
            }
        })
    }
}

struct ButttonView_Previews: PreviewProvider {
    static var previews: some View {
        TitleButton(title: "Submit")
    }
}
