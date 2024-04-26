//
//  ContentView.swift
//  GameDartsSliderSUI
//
//  Created by Алексей Попов on 26.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = Double.random(in: 0...100).rounded()
    @State private var targetValue = Double.random(in: 0...100).rounded()
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    private let contentViewMV = ContentViewViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Text("Подвиньте слайдер, как можно ближе к:")
                Text("\(targetValue.formatted())")
            }
            HStack {
                Text("0")
                
                SliderRepresentation(
                    currentValue: $currentValue,
                    targetValue: targetValue
                )
                
                Text("100")
            }
            
            Button("Проверь меня!", action: {
                let score = contentViewMV.computeScore(
                    targetValue: targetValue,
                    currentValue: currentValue
                )
                showAlert = true
                alertMessage = "\(score)"
            })
            .alert("Ваш счет:", isPresented: $showAlert, actions: {}) {
                Text(alertMessage)
            }
            
            Button("Начать заново", action: {
                targetValue = contentViewMV.targetValue}
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
