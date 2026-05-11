//
//  NavigationStackBasicView.swift
//  NavegacaoSwiftUI
//
//  Created by Gabriel Mors Pulga on 06/05/26.
//

import SwiftUI

struct NavigationStackBasicView: View {
    
    @State var goNavigation: Bool = false
    
    var body: some View {
//        Container principal de navegacao no SwiftUI
        NavigationStack {
            
            VStack(spacing: 20) {
//                PRIMEIRA FORMA:
//                NavigationLink simples
//                O proprio SwiftUI cria o botao e a navegacao
                NavigationLink("Ir para a tela 02 com texto nativo") {
                    Tela02View()
                }
                
//                SEGUNDA FORMA:
//                NavigationLink Customizado
//                Podemos personalizar totalemten a interface
                NavigationLink(destination: Tela02View()) {
                    Text("Ir para a tela 02 com texto customizável")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                }

//                TERCEIRA FORMA:
//                A navegacao acontece atravéz de estado
                Button("Tela 02 programaticamente") {
                    goNavigation.toggle()
                }
                .navigationTitle("Navegações")
                .navigationBarTitleDisplayMode(.large)
                
                .navigationDestination(isPresented: $goNavigation) {
                    Tela02View()
                }
                
            }
        }
    }
}

#Preview {
    NavigationStackBasicView()
}
