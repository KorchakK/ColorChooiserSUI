//
//  ContentView.swift
//  ColorChooiserSUI
//
//  Created by Konstantin Korchak on 17.05.2022.
//

import SwiftUI

struct ContentView: View {

    @State private var redSliderValue = 80.0
    @State private var greenSliderValue = 150.0
    @State private var blueSliderValue = 230.0
    
    @State private var colorOfView = Color(
        red: 80 / 255,
        green: 150 / 255,
        blue: 230 / 255
    )

    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.5, blue: 1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ColorView(colorOfView: $colorOfView)
                    .padding(.bottom, 30)
                SliderView(sliderValue: $redSliderValue, colorOfView: $colorOfView, sliderColor: .red)
                SliderView(sliderValue: $greenSliderValue, colorOfView: $colorOfView, sliderColor: .green)
                SliderView(sliderValue: $blueSliderValue, colorOfView: $colorOfView, sliderColor: .blue)
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
