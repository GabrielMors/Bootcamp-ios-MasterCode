//
//  ChangeValue.swift
//  PropertyWrappers
//
//  Created by Gabriel Mors Pulga on 04/05/26.
//

import SwiftUI

//View Pai
struct ChangeValue: View {
    
    @State var value: Double = 50
    
    var body: some View {
        SetValueView(newValue: $value)
        Slider(value: $value, in: 0...100, step: 1)
            .padding()
    }
}

// View Filha
struct SetValueView: View {
    
    @Binding var newValue: Double
    
    
    var body: some View {
        VStack {
            Text("\(newValue.formatted())")
            
            Button("Clique aqui") {
                newValue += 10
            }
        }
        
    }
}

#Preview {
    ChangeValue()
}
