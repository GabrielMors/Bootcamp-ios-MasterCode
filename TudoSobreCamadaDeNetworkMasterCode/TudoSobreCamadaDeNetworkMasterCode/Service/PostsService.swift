//
//  PostsService.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 09/04/26.
//

import Foundation

struct ErrorHandler: Error {
  let message: String
  let statusCode: Int?
}

class PostsService {

  // MARK: - GET - Listar todos os Posts

  static func fetchAllPosts(completion: @escaping (Result<[Post], ErrorHandler>) -> Void) {
    // URL Fornecida
    let urlString = "https://jsonplaceholder.typicode.com/posts"

    guard let url = URL(string: urlString) else {
      let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
      completion(.failure(error))
      return
    }

    // Task de requisição utilizando URLSession.shared (singleton)
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição: \(error.localizedDescription)", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Fazendo cast do response para HTTPURLResponse para ter acesso ao statusCode
      guard let httpResponse = response as? HTTPURLResponse else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Resposta inválida", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou SUCESSO!!! Se NÃO, deu ruim!!
      guard (200..<300).contains(httpResponse.statusCode) else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição. Status Code: \(httpResponse.statusCode)", statusCode: httpResponse.statusCode)
          completion(.failure(error))
        }
        return
      }

      // Verifica se temos data (dados binários para transformamos em JSON(nesse caso))
      guard let data else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Nenhum dado foi retornado da requisição", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      do {
        // Decodificação do Data para um array de Post
        let posts = try JSONDecoder().decode([Post].self, from: data)
        DispatchQueue.main.async {
          completion(.success(posts))
        }
      } catch {
        // Error ao DECODIFICAR!!!! Verifique se o objeto swift está IDENTIFICO ao que veem do json (nome, tipagem)
        DispatchQueue.main.async {
          let errorHandler = ErrorHandler(message: "Error ao decodificar dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)
          completion(.failure(errorHandler))
        }
      }
    }

    // Inicia a requisição
    task.resume()
  }

  // MARK: - GET - Listar post especifico por Id
  static func fetchPostById(id: Int, completion: @escaping (Result<Post, ErrorHandler>) -> Void) {
    // URL Fornecida
    let urlString = "https://jsonplaceholder.typicode.com/posts/\(id)"

    guard let url = URL(string: urlString) else {
      let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
      completion(.failure(error))
      return
    }

    // Task de requisição utilizando URLSession.shared (singleton)
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição: \(error.localizedDescription)", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Fazendo cast do response para HTTPURLResponse para ter acesso ao statusCode
      guard let httpResponse = response as? HTTPURLResponse else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Resposta inválida", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou SUCESSO!!! Se NÃO, deu ruim!!
      guard (200..<300).contains(httpResponse.statusCode) else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição. Status Code: \(httpResponse.statusCode)", statusCode: httpResponse.statusCode)
          completion(.failure(error))
        }
        return
      }

      // Verifica se temos data (dados binários para transformamos em JSON(nesse caso))
      guard let data else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Nenhum dado foi retornado da requisição", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      do {
        // Decodificação do Data para um Post
        let post = try JSONDecoder().decode(Post.self, from: data)
        DispatchQueue.main.async {
          completion(.success(post))
        }
      } catch {
        // Error ao DECODIFICAR!!!! Verifique se o objeto swift está IDENTIFICO ao que veem do json (nome, tipagem)
        DispatchQueue.main.async {
          let errorHandler = ErrorHandler(message: "Error ao decodificar dados recebidos: \(error.localizedDescription)", statusCode: httpResponse.statusCode)
          completion(.failure(errorHandler))
        }
      }
    }

    // Inicia a requisição
    task.resume()
  }

  static func createPost(title: String, body: String, userId: Int, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
    // URL Fornecida
    let urlString = "https://jsonplaceholder.typicode.com/posts"

    guard let url = URL(string: urlString) else {
      let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
      completion(.failure(error))
      return
    }

    // Criar o corpo da requisição com os parametros usando dicionario
    let json: [String: Any] = [
      "title": title,
      "body": body,
      "userId": userId,
    ]
    
    guard let httpBody = try? JSONSerialization.data(withJSONObject: json, options: []) else {
      let error = ErrorHandler(message: "Erro ao serializar o JSON", statusCode: nil)
      completion(.failure(error))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = httpBody
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    // Task de requisição utilizando URLSession.shared (singleton)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let error {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição: \(error.localizedDescription)", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Fazendo cast do response para HTTPURLResponse para ter acesso ao statusCode
      guard let httpResponse = response as? HTTPURLResponse else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Resposta inválida", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou SUCESSO!!! Se NÃO, deu ruim!!
      guard (200..<300).contains(httpResponse.statusCode) else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição. Status Code: \(httpResponse.statusCode)", statusCode: httpResponse.statusCode)
          completion(.failure(error))
        }
        return
      }

      completion(.success(()))
    }

    // Inicia a requisição
    task.resume()
  }

  static func replacePostEncodable(postReplace: PostReplace, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
    // URL Fornecida
    let urlString = "https://jsonplaceholder.typicode.com/posts/\(postReplace.id)"

    guard let url = URL(string: urlString) else {
      let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
      completion(.failure(error))
      return
    }
    
    guard let httpBody = try? JSONEncoder().encode(postReplace) else {
      let error = ErrorHandler(message: "Erro ao serializar o JSON", statusCode: nil)
      completion(.failure(error))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.httpBody = httpBody
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    // Task de requisição utilizando URLSession.shared (singleton)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let error {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição: \(error.localizedDescription)", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Fazendo cast do response para HTTPURLResponse para ter acesso ao statusCode
      guard let httpResponse = response as? HTTPURLResponse else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Resposta inválida", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou SUCESSO!!! Se NÃO, deu ruim!!
      guard (200..<300).contains(httpResponse.statusCode) else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição. Status Code: \(httpResponse.statusCode)", statusCode: httpResponse.statusCode)
          completion(.failure(error))
        }
        return
      }

      completion(.success(()))
    }

    // Inicia a requisição
    task.resume()
  }


  static func deletePost(id: Int, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
    // URL Fornecida
    let urlString = "https://jsonplaceholder.typicode.com/posts/\(id)"

    guard let url = URL(string: urlString) else {
      let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
      completion(.failure(error))
      return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"

    // Task de requisição utilizando URLSession.shared (singleton)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let error {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição: \(error.localizedDescription)", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Fazendo cast do response para HTTPURLResponse para ter acesso ao statusCode
      guard let httpResponse = response as? HTTPURLResponse else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Resposta inválida", statusCode: nil)
          completion(.failure(error))
        }
        return
      }

      // Verifica se o statusCode está entre 200 a 299, se SIM é pq o back retornou SUCESSO!!! Se NÃO, deu ruim!!
      guard (200..<300).contains(httpResponse.statusCode) else {
        DispatchQueue.main.async {
          let error = ErrorHandler(message: "Erro ao realizar a requisição. Status Code: \(httpResponse.statusCode)", statusCode: httpResponse.statusCode)
          completion(.failure(error))
        }
        return
      }

      completion(.success(()))
    }

    // Inicia a requisição
    task.resume()
  }





}
