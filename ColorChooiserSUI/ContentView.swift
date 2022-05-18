//
//  ContentView.swift
//  ColorChooiserSUI
//
//  Created by Konstantin Korchak on 17.05.2022.
//

import SwiftUI

enum Field: Hashable {
    case red
    case green
    case blue
}

struct ContentView: View {

    @State private var redSliderValue = 80.0
    @State private var greenSliderValue = 150.0
    @State private var blueSliderValue = 230.0
    
    @State private var colorOfView = Color(
        red: 80 / 255,
        green: 150 / 255,
        blue: 230 / 255
    )
    
    @FocusState private var focusedField: Field?

    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.5, blue: 1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ColorView(colorOfView: $colorOfView)
                    .padding(.bottom, 30)
                SliderView(
                    focusedField: _focusedField,
                    sliderValue: $redSliderValue,
                    colorOfView: $colorOfView,
                    textField: "80",
                    sliderColor: .red
                )
                SliderView(
                    focusedField: _focusedField,
                    sliderValue: $greenSliderValue,
                    colorOfView: $colorOfView,
                    textField: "150",
                    sliderColor: .green
                )
                SliderView(
                    focusedField: _focusedField,
                    sliderValue: $blueSliderValue,
                    colorOfView: $colorOfView,
                    textField: "230",
                    sliderColor: .blue
                )
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("▲", action: {
                            focusedField = focusedField == .green ? .red : .green
                        })
                            .disabled(focusedField == .red)
                        Button("▼", action: {
                            focusedField = focusedField == .green ? .blue : .green
                        } )
                            .disabled(focusedField == .blue)
                        Spacer()
                        Button("Done", action: { focusedField = .none })
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
