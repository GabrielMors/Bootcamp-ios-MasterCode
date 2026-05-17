//
//  MovieDetailService.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import Foundation

final class MovieDetailService {
    //criando instancia do apiClient -> objetivo é ter uma instancia manipulavel para injetar um spy
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func fetchMovieDetail(id: Int, completion: @escaping (Result<MovieDetailResponse, NetworkError>) -> Void) {
        let request = APIRequest(
            endpoint: "movie/\(id)?append_to_response=credits,videos,recommendations",
            httpMethod: .get
        )
        
        apiClient.request(request: request, decodeType: MovieDetailResponse.self, completion: completion)
    }
}
