//
//  ContentView.swift
//  NavegacaoSwiftUI
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var isPresentFullScreen: Bool = false
    
    var body: some View {
        VStack {
            Button("Apresentar Sheet") {
                isPresented.toggle()
            }
            
            Button("Apresentar Full Screen") {
                isPresentFullScreen.toggle()
            }
            
            .sheet(isPresented: $isPresented) {
                Tela02View()
            }
            
            .fullScreenCover(isPresented: $isPresentFullScreen) {
                Tela02View()
            }
            
        }
        .padding()
    }
}

struct Tela02View: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            
            if colorScheme == .dark {
                // Modo escuro
            }
            
            Color.red.ignoresSafeArea()
            
            VStack {
                Text("Olá mundo!!")
                Button("Voltar") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
