//
//  Toggle.swift
//  PrimeiroAppSwifUI
//
//  Created by Gabriel Mors Pulga on 04/05/26.
//

import SwiftUI

struct ToggleView: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        ZStack {
            Color(isOn ? .blue : .orange)
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
    }
}

#Preview {
    ToggleView()
}
