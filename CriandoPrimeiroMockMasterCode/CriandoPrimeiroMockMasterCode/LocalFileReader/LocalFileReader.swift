//
//  LocalFileReader.swift
//  CriandoPrimeiroMockMasterCode
//
//  Created by Caio Fabrini on 06/04/26.
//

import Foundation

enum NetworkError {
  case invalidURL(url: String)
  case invalidResponse
  case decodingError(Error)
  case networkFailure(Error)
  case statusCode(code: Int)
  case noData
}

extension NetworkError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidURL(let url):
      return "URL invalida -> \(url)"
    case .invalidResponse:
      return "Resposta invalida da API"
    case .decodingError(let error):
      return "Decodificação falhou: \(error.localizedDescription)"
    case .networkFailure(let error):
      return "Falha na conexão: \(error.localizedDescription)"
    case .statusCode(code: let code):
      return "Status code inesperado: Código \(code)"
    case .noData:
      return "Não houve retorno da API"
    }
  }
}



struct LocalFileReader {
  static func loadJSON<T: Decodable>(fileName: String, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
      completion(.failure(.invalidURL(url: fileName)))
      return
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      do {
        let data = try Data(contentsOf: url)
        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        DispatchQueue.main.async {
          completion(.success(decodedObject))
        }
      } catch {
        DispatchQueue.main.async {
          completion(.failure(.decodingError(error)))
        }
      }
    }
  }
}
