//
//  AsyncAwait.swift
//  AsyncAwait
//
//  Created by Marcello Pontes Domingos on 11/05/26.
//

import SwiftUI

// MARK: - View Principal
// Esta View é responsável por:
// 1. Criar a ViewModel
// 2. Observar mudanças de estado
// 3. Exibir loading, erro ou lista de posts

struct AsyncAwait: View {
    // @StateObject mantém a ViewModel viva durante o ciclo de vida da tela.
    // A View observa automaticamente mudanças nos @Published da ViewModel.
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        // NavigationStack adiciona suporte à navegação e título da tela.
        NavigationStack {
            Group {
                // Enquanto a requisição estiver acontecendo,
                // exibimos um indicador de carregamento.
                if viewModel.isLoading {
                    ProgressView("Carregando posts...")
                // Caso ocorra algum erro na chamada da API,
                // exibimos a mensagem para o usuário.
                } else if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 12) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundStyle(.yellow)

                        Text(errorMessage)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                // Se os dados forem carregados com sucesso,
                // exibimos os posts em formato de lista.
                } else {
                    // List funciona como uma tabela dinâmica.
                    // Cada item da coleção será renderizado automaticamente.
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(post.title)
                                .font(.headline)

                            Text(post.body)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Posts")
        }
        // .task executa código assíncrono quando a tela aparece.
        // Aqui chamamos a função async da ViewModel.
        .task {
            await viewModel.fetchPosts()
        }
    }
}

#Preview {
    AsyncAwait()
}
