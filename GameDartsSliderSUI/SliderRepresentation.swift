//
//  SliderRepresentation.swift
//  GameDartsSliderSUI
//
//  Created by Алексей Попов on 26.04.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let contentViewMV:ContentViewViewModel

    var targetValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = Float(currentValue)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        let alpha = contentViewMV.computeScore(targetValue: targetValue, currentValue: currentValue)
        
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: SliderRepresentation
        
        init(_ sliderRepresentation: SliderRepresentation) {
            self.parent = sliderRepresentation
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            parent.currentValue = Double(sender.value)
        }
    }
}
