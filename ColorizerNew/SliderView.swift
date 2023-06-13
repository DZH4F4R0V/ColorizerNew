//
//  SliderView.swift
//  ColorizerNew
//
//  Created by J Eff on 13.06.2023.
//

import SwiftUI

struct SliderView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            ColorSliderView(value: $redSliderValue)
            ColorSliderView(value: $greenSliderValue)
            ColorSliderView(value: $blueSliderValue)
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}


struct ColorSliderView: View {
    @Binding var value: Double
    
    var body: some View {
        HStack{
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255, step: 1)
                .padding(EdgeInsets(top: 3, leading: 0, bottom: 0, trailing: 3))
            Text("\(lround(value))").foregroundColor(.red)
        }
    }
}
