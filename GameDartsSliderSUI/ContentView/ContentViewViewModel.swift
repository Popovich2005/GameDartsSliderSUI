//
//  ContentViewViewModel.swift
//  GameDartsSliderSUI
//
//  Created by Алексей Попов on 26.04.2024.
//

import Foundation
import Observation

@Observable final class ContentViewViewModel {
    
    var targetValue: Double {
          Double.random(in: 0...100).rounded()
      }
    
    func computeScore(targetValue: Double, currentValue: Double) -> Int {
        let difference = abs(Int(targetValue) - Int(lround(currentValue)))
        return 100 - difference
    }
}
