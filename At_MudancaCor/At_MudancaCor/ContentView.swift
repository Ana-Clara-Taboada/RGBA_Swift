//
//  ContentView.swift
//  At_MudancaCor
//
//  Created by COTEMIG on 09/09/25.
//

import SwiftUI

struct ContentView: View {
    

    @State private var verde: Double = 255
    @State private var vermelho: Double = 255
    @State private var azul: Double = 255
    @State private var opacidade: Int = 10

    @State private var circleColor: Color = .white

    var body: some View {
        VStack(spacing: 20) {
                Circle()
                .fill(circleColor)
                .frame(width: 300, height: 300)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            
            VStack {
                Text("Vermelho: \(Int(vermelho))")
                Slider(value: $vermelho, in: 0...255)
            }

            VStack {
                Text("Verde: \(Int(verde))")
                Slider(value: $verde, in: 0...255)
            }

            VStack {
                Text("Azul: \(Int(azul))")
                Slider(value: $azul, in: 0...255)
            }

            Stepper("Alpha: \(Double(opacidade) / 10.0)", value: $opacidade, in: 0...10)

            Button("Aplicar Cor") {
                let red = vermelho / 255.0
                let green = verde / 255.0
                let blue = azul / 255.0
                let opacit = Double(opacidade) / 10.0
                
                circleColor = Color(red: red, green: green, blue: blue, opacity: opacit)
            }
            .padding()
            .background(Color.blue.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
