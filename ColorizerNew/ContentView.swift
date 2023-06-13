//
//  ContentView.swift
//  ColorizerNew
//
//  Created by J Eff on 13.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Color(red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>)
                SliderView()
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
