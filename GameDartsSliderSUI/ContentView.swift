//
//  ContentView.swift
//  GameDartsSliderSUI
//
//  Created by Алексей Попов on 26.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue = Double.random(in: 0...100).rounded()
    @State var targetValue = Double.random(in: 0...100).rounded()

    
    private let contentViewMV = ContentViewViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Text("Подвиньте слайдер, как можно ближе к:")
                Text("\(targetValue.formatted())")
            }
            HStack {
                Text("0")
                
                SliderRepresentation(currentValue: $currentValue, targetValue: $targetValue)
                
                Text("100")
            }
            
            Button("Проверь меня!", action: {} )
            
            Button("Начатьзаново", action: {})
        }
        .padding()
    }
}
//#Preview {
//    ContentView(currentValue: 25)
//}
