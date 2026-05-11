//
//  NavigationStackView.swift
//  NavegacaoSwiftUI
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import SwiftUI


struct NavigationStackView: View {
    
//    Essa variavel representa a PILHA de navegacao.
//    Tudo que for adicionado aqui vira uma nova navegacao
    
    @State var navigationPath: [String] = []
    
    var body: some View {
        
//        NavigationStack está controlando a navegacao ATRAVÉS do "path"
        NavigationStack(path: $navigationPath) {
            
            VStack {
                Button("Ir para a tela de detalhes") {
//                    Adicionando "Detalhes" a pilha de navegacao e automaticamente navega.
                    navigationPath.append("Detalhes")
                }
                
                Button("Ir para a tela de detalhes e para a tela de perfil") {
                    navigationPath.append("Detalhes")

                    navigationPath.append("Profile")
                }
            }
            
//            Aqui definimos quando um String aparecer no path, vai mostrar qual tela deve aparecer
            .navigationDestination(for: String.self) { view in
                if view == "Detalhes" {
                    Tela02View()
                } else if view == "Profile" {
                    Color.blue
                }
            }
        }
    }
}

#Preview {
    NavigationStackView()
}
