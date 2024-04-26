//
//  SliderRepresentation.swift
//  GameDartsSliderSUI
//
//  Created by Алексей Попов on 26.04.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var currentValue: Double
    
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
        let distance = abs(targetValue - currentValue)
        let maxDistance = CGFloat(100)
        let alpha = 1.0 - min(distance / maxDistance, 1.0)
        
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: alpha)
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
