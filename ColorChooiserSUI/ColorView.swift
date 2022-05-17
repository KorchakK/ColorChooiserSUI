//
//  ColorView.swift
//  ColorChooiserSUI
//
//  Created by Konstantin Korchak on 17.05.2022.
//

import SwiftUI

struct ColorView: View {
    @Binding var colorOfView: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(height: 230)
            .foregroundColor(colorOfView)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.white, lineWidth: 8)
            )
    }
}
