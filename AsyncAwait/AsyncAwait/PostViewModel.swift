//
//  PostViewModel.swift
//  AsyncAwait
//
//  Created by Marcello Pontes Domingos on 11/05/26.
//

import SwiftUI
import Combine

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

// MARK: - ViewModel
@MainActor
final class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Async/Await
    // O async indica que esta função pode executar operações assíncronas.
    //
    // DIFERENÇA PARA O GCD:
    // Aqui o código fica linear e mais legível.
    // O Swift gerencia a suspensão e retomada da execução automaticamente.
    func fetchPosts() async {
        // Criação da URL do endpoint.
        // guard garante que a URL seja válida.
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            errorMessage = "URL inválida"
            return
        }

        isLoading = true
        errorMessage = nil

        // do/catch é utilizado para tratar possíveis erros.
        do {
            // URLSession realiza a chamada HTTP.
            // try await pausa a execução até a resposta chegar.
            // O retorno contém os dados da resposta.
            //
            // DIFERENÇA PARA O GCD:
            // No GCD precisaríamos utilizar closures/callbacks.
            // Aqui o fluxo parece síncrono, mesmo sendo assíncrono.
            let (data, _) = try await URLSession.shared.data(from: url)

            // JSONDecoder converte o JSON recebido
            // em um array de objetos Post.
            let decodedPosts = try JSONDecoder().decode([Post].self, from: data)

            // Atualizamos a lista de posts.
            // Como ela é @Published, a View será atualizada automaticamente.
            posts = decodedPosts
        // Caso qualquer etapa falhe,
        // o erro será capturado aqui.
        } catch {
            errorMessage = "Erro ao buscar posts: \(error.localizedDescription)"
        }
        // Finalizamos o loading após concluir a requisição.
        isLoading = false
    }

    // MARK: - GCD / Completion Handler
    // Esta implementação realiza exatamente a mesma chamada,
    // porém utilizando o modelo antigo baseado em callbacks.
    //
    // DIFERENÇAS PRINCIPAIS:
    // - Usa closure ao invés de await
    // - Precisa controlar thread manualmente
    // - Código mais verboso
    // - Mais difícil de manter em fluxos complexos
    func fetchPostsGCD() {

        // Criação da URL do endpoint.
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            errorMessage = "URL inválida"
            return
        }

        // Iniciamos o loading.
        isLoading = true
        errorMessage = nil

        // dataTask utiliza completion handler (callback).
        URLSession.shared.dataTask(with: url) { data, response, error in

            // DIFERENÇA PARA ASYNC/AWAIT:
            // No GCD precisamos voltar manualmente
            // para a Main Thread para atualizar a interface.
            DispatchQueue.main.async {

                // Encerramos o loading.
                self.isLoading = false

                // Tratamento de erro.
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }

                // Verificamos se os dados existem.
                guard let data = data else {
                    self.errorMessage = "Sem dados"
                    return
                }

                do {
                    // Conversão do JSON em objetos Swift.
                    let decodedPosts = try JSONDecoder().decode([Post].self, from: data)

                    // Atualização da lista.
                    self.posts = decodedPosts

                } catch {
                    self.errorMessage = error.localizedDescription
                }
            }

        }.resume() // Inicia a requisição.
    }
}
