//
//  ContentView.swift
//  SwiftUIViewsExample
//
//  Created by Ankush Bhatia on 11/08/20.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedView = ViewType.button
    @State private var isDestinationActive: Bool = false
    let viewTypes: [ViewType]

    var body: some View {
        NavigationView(content: {
            VStack {
                Spacer()
                    .frame(height: 100, alignment: .center)
                titleView
                pickerView
                Spacer()
                submitButton
                Spacer()
            }
            .navigationBarTitle("View Examples",
                                displayMode: .inline)
        })
    }

    private var titleView: some View {
        Text("Selected View: \(selectedView.rawValue)")
    }
    
    private var submitButton: some View {
        NavigationLink(
            destination: destinationView,
            isActive: $isDestinationActive,
            label: {
                Text("Submit")
                    .foregroundColor(.green)
                    .background(Color.white)
            })
    }
    
    private var pickerView: some View {
        Picker(selection: $selectedView,
               label: Text("Please choose a view type")) {
            ForEach(viewTypes, id: \.self) { viewType in
                Text(viewType.rawValue)
            }
        }
    }
    
    @ViewBuilder
    private var destinationView: some View {
        switch selectedView {
        case .button:
            ButtonsView()
        default:
            EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static let viewTypes: [ViewType] = ViewType.allCases

    static var previews: some View {
        ContentView(viewTypes: viewTypes)
    }
}
