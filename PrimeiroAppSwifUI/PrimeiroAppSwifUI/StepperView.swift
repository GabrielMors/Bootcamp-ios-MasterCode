//
//  StepperView.swift
//  PrimeiroAppSwifUI
//
//  Created by Gabriel Mors Pulga on 04/05/26.
//

import SwiftUI

struct StepperView: View {
    
    @State private var value: Int = 0
    let colors: [Color] = [.orange, .red, .gray, .blue, .green, .purple, .pink]
    
    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }
    
    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }
    
    var body: some View {
        
        Stepper {
            Text("Value: \(value) Color: \(colors[value].description)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
        .background(colors[value])
//        .labelsHidden()
    }
}

#Preview {
    StepperView()
}
