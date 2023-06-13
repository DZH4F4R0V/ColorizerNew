//
//  ContentView.swift
//  ColorizerNew
//
//  Created by J Eff on 13.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    let backgroundColor = CGColor(red: 0, green: 0.29, blue: 0.588, alpha: 1)
    
    var body: some View {
        ZStack {
            Color(backgroundColor).ignoresSafeArea()
            VStack {
                colorView(
                    red: $redSliderValue,
                    green: $greenSliderValue,
                    blue: $blueSliderValue
                )
                    .frame(width: 350, height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 4))
                    .cornerRadius(20)
                    .shadow(color: Color(.displayP3,
                                         red: redSliderValue / 255,
                                         green: greenSliderValue / 255,
                                         blue: blueSliderValue / 255,
                                         opacity: 1.0
                                        ), radius: 30)
                    .padding()
                VStack {
                    ColorSlidersView(value: $redSliderValue, color: .red)
                    ColorSlidersView(value: $greenSliderValue, color: .green)
                    ColorSlidersView(value: $blueSliderValue, color: .blue)
                }
                .foregroundColor(.white)
                .padding()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlidersView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack{
            Text("\(lround(value))").foregroundColor(.white)
                .frame(width: 50)
            Slider(value: $value, in: 0...255, step: 1)
                .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 3))
                .accentColor(color)
            Text("\(lround(value))").foregroundColor(.white)
                .frame(width: 50)
        }
    }
}

struct colorView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Color(
            .displayP3,
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            opacity: 1.0
        )
    }
}
