//
//  APIClientSpy.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 18/05/26.
//

import Foundation
@testable import MasterCineProfessor

class APIClientSpy: APIClientProtocol {
    
    var result: Result<MovieDetailResponse, NetworkError>?
    var requestMethodCount: Int = 0
    
    func request<T>(
        request: APIRequest,
        decodeType: T.Type,
        completion: @escaping (Result<T, MasterCineProfessor.NetworkError>) -> Void
    ) where T : Decodable {
        guard let result = result as? Result<T, NetworkError> else {
            fatalError("resposta mal configurada, ATENÇÃO")
        }
        requestMethodCount += 1
        completion(result)
    }
    
    
}
