//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Gabriel Mors Pulga on 04/05/26.
//

import SwiftUI

// MARK: Property wrappers

//    Property wrappers são como "atalhos" que você coloca antes das propriedades para adicionar regras especiais. Eles ajudam a economizar tempo e manter o código organizado. Cada atalho (@) tem uma função específica, como controlar quando as propriedades mudam ou limitar os valores que elas podem ter.

// EXEMPLOS DOS MAIS UTILIZADOS:

// @State -> é usado para criar uma propriedade mutável dentro de uma view. Ele permite que a view observe mudanças nessa propriedade e atualize automaticamente a interface quando ela muda. Usado principalmente para controlar o estado interno de uma view.

// @Binding -> é usado para criar uma ligação entre uma propriedade de uma view pai e uma view filho. Isso permite que a view filho leia e atualize a propriedade original da view pai, mantendo-as sincronizadas. É útil quando você deseja que as mudanças em uma view filho afetem a view pai.

// @ObservedObject -> é usado para conectar uma instância de uma classe observável (geralmente conformando o protocolo ObservableObject) a uma view. Isso permite que a view observe as mudanças de propriedades nessa classe e atualize quando ocorrerem alterações.

// @Published -> é usado dentro de classes observáveis para marcar propriedades específicas como "publicamente publicadas". Quando o valor de uma propriedade marcada com @Published muda, ele notifica automaticamente os observadores, como as views, para que possam ser atualizadas.

// @Environment ->  é usado para acessar valores ambientais (como tamanhos de fonte, cores, etc.) fornecidos pelo ambiente de execução do aplicativo. Isso permite que as views acessem configurações globais sem passar esses valores manualmente.

// @FetchRequest -> é usado com o Core Data para buscar dados do banco de dados. Ele aceita uma consulta e fornece os resultados como uma lista de objetos observáveis. Usado para exibir dados do banco de dados na interface.

// @AppStorage e @SceneStorage -> Ambos são usados para armazenar dados de forma persistente entre sessões do aplicativo ou entre diferentes cenas em um aplicativo de várias janelas. O @AppStorage é para armazenar valores simples como números ou strings, enquanto o @SceneStorage é usado para armazenar dados específicos da cena.



struct ContentView: View {
    
    @State var toggleMessage: Bool = true
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Text(toggleMessage ? "Olá mundo!" : "Tchau a todos!")
                .font(.system(size: 26, weight: .bold))
            
            Button("Alterar mensagem") {
                toggleMessage.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(text)
                .font(.system(size: 26, weight: .bold))
                
            TextField("Digite seu nome", text: $text)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
