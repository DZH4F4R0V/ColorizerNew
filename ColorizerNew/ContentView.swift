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
                Color(
                    .displayP3,
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255,
                    opacity: 1.0
                )
                .frame(width: 300, height: 150)
                .cornerRadius(20)
                .shadow(radius: 10)
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
