//
//  ProgessViewTeste.swift
//  PrimeiroAppSwifUI
//
//  Created by Gabriel Mors Pulga on 04/05/26.
//

import SwiftUI

struct ProgessViewTeste: View {
    
    @State var progress: Double = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Avançar") {
                progress += 0.5
            }
            
            ProgressView(value: progress, total: 10)
            
            Button("Diminuir") {
                progress -= 0.5
            }
        }
        .padding()
    }
}

#Preview {
    ProgessViewTeste()
}
