//
//  NetworkError.swift
//  TudoSobreCamadaDeNetworkMasterCode
//
//  Created by Caio Fabrini on 13/04/26.
//

import Foundation

//Protocolo Equatable é necessario para poder ser usado em comparações 
enum NetworkError: Equatable {
  case invalidURL(url: String)
  case invalidResponse
  case invalidRequest
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
    case .invalidRequest:
      return "Error ao montar a request"
    }
  }
}

//MARK: Conformidade com o protocolo Equatable
extension NetworkError {
    //nonisolatad -> contexto não isolado ou seja pode ser utilizado em qualquer thread
    nonisolated static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL(let lhsURL), .invalidURL(let rhsURL)):
            return lhsURL == rhsURL
        case (.invalidResponse, .invalidResponse):
            return true
        case (.invalidRequest, .invalidRequest):
            return true
        case (.noData, .noData):
            return true
        case (.statusCode(let lhsCode), .statusCode(let rhsCode)):
            return lhsCode == rhsCode
        case (.decodingError, .decodingError):
            return true
        case (.networkFailure, .networkFailure):
            return true
        default:
            return false
        }
    }
}
