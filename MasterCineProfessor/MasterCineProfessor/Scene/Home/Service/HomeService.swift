//
//  HomeService.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 20/04/26.
//

import Foundation

class HomeService {
    //GCD
    func fetchPopular(page: Int, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let request = APIRequest(endpoint: "movie/popular?page=\(page)")
        APIClient.shared.request(request: request, decodeType: MovieResponse.self, completion: completion)
    }
    
    //Async/await
    func fetchPopular(page: Int) async throws -> MovieResponse {
        let request = APIRequest(endpoint: "movie/popular?page=\(page)")
        return try await APIClient.shared.request(request: request,decodeType: MovieResponse.self)
    }
    
    
    func search(query: String, page: Int, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        let request = APIRequest(endpoint: "search/movie?query=\(encoded)&page=\(page)&include_adult=false")
        APIClient.shared.request(request: request, decodeType: MovieResponse.self, completion: completion)
    }
}
