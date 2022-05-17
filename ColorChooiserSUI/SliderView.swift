//
//  SliderView.swift
//  ColorChooiserSUI
//
//  Created by Konstantin Korchak on 17.05.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var sliderValue: Double
    @Binding var colorOfView: Color
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .font(.title3)
                .foregroundColor(.white)
                .frame(minWidth: 45)
            Slider(value: Binding(get: { sliderValue }, set: { newValue in
                sliderValue = newValue
                updateColorView()

            }), in: 0...255)
                .tint(sliderColor)
            TextField("", text: Binding(get: { "\(Int(sliderValue))" }, set: { value in
                sliderValue = Double(value) ?? 0
                updateColorView()
            }))
                .textFieldStyle(.roundedBorder)
                .frame(width: 45)
        }
    }
    
    private func updateColorView() {
        switch sliderColor {
        case .red:
            let green = colorOfView.cgColor?.components?[1] ?? 0
            let blue = colorOfView.cgColor?.components?[2] ?? 0
            colorOfView = Color(
                red: sliderValue / 255,
                green: green,
                blue: blue
            )
        case . green:
            let red = colorOfView.cgColor?.components?[0] ?? 0
            let blue = colorOfView.cgColor?.components?[2] ?? 0
            colorOfView = Color(
                red: red,
                green: sliderValue / 255,
                blue: blue
            )
        default:
            let red = colorOfView.cgColor?.components?[0] ?? 0
            let green = colorOfView.cgColor?.components?[1] ?? 0
            colorOfView = Color(
                red: red,
                green: green,
                blue: sliderValue / 255
            )
        }
    }
}
