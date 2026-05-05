//
//  ContentView.swift
//  PrimeiroAppSwifUI
//
//  Created by Gabriel Mors Pulga on 04/05/26.
//

import SwiftUI

// VStack (Vertical Stack):
// O VStack é um layout que empilha as visualizações verticalmente, uma em cima da outra

// HStack (Horizontal Stack):
// O HStack é um layout que empilha as visualizações horizontalmente, uma ao lado da outra

// ZStack (Z-Index Stack):
// O ZStack empilha as visualizações uma em cima da outra em um plano 3D. A visualizações mais próxima será a mais visível. Isso é útil para criar sobreposições, como elementos flutuantes

struct ContentView: View {
    
    
    
    var body: some View {
        
        ZStack {
            
            VStack {
                Label("Primeiro App SwiftUI", systemImage: "book")
                
                Label {
                    Text("Agora vai")
                        .font(.title)
                        .background(Color.orange)
                } icon: {
                    Image(systemName: "star")
                        .frame(width: 26, height: 36)
                        .background(Color.blue)
                }

                HStack {
                    Text("Olá mundo")
                        .font(.title)
                        .background(Color.red)
                    
                    Text("Pulga")
                        .font(.largeTitle)
                        .background(Color.yellow)
                }
                
                Button("Clique aqui") {
                    print("Acaoooo")
                }
                
                Button {
                    print("Acao do botao")
                } label: {
                    Label("Bootcamp iOS", systemImage: "book")
                        .font(.footnote)
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
