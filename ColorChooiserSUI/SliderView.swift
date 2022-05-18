//
//  SliderView.swift
//  ColorChooiserSUI
//
//  Created by Konstantin Korchak on 17.05.2022.
//

import SwiftUI

struct SliderView: View {
    
    @FocusState var focusedField: Field?
    @FocusState private var isFieldFocused: Bool

    @Binding var sliderValue: Double
    @Binding var colorOfView: Color
    
    @State private var textField = ""
    
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
                textField = value
            }))
                .focused($focusedField, equals: getEqual())
                .focused($isFieldFocused)
                .textFieldStyle(.roundedBorder)
                .cornerRadius(6)
                .frame(width: 45)
                .keyboardType(.numberPad)
                .onChange(of: isFieldFocused) { isFocused in
                    if !isFocused {
                        sliderValue = Double(textField) ?? 0
                        updateColorView()
                    }
                }
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
    
    private func getEqual() -> Field {
        switch sliderColor {
        case .red:
            return .red
        case . green:
            return .green
        default:
            return .blue
        }
    }
}
