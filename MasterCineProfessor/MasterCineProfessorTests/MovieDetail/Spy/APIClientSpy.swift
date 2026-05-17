//
//  APIClientSpy.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 16/05/26.
//


import Foundation
@testable import MasterCineProfessor

final class APIClientSpy: APIClientProtocol {
    
    var result: Result<MovieDetailResponse, NetworkError>?
    //propriedade usada para garantirmos que o metodo não criará um loop
    //tal teste não aumenta cobertura de testes porém é de suma importancia principalmente em comunicações com backend
    var requestMethodCount: Int = 0
    
    func request<T>(
        request: APIRequest,
        decodeType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) where T : Decodable {
        
        guard let result = result as? Result<T, NetworkError> else {
            fatalError("Result não configurado corretamente")
        }
        requestMethodCount += 1
        completion(result)
    }
}
