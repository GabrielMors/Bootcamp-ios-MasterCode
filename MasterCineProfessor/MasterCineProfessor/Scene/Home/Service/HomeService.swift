//
//  HomeService.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 20/04/26.
//

import Foundation

class HomeService {
  func fetchPopular(page: Int, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
    let request = APIRequest(endpoint: "movie/popular?page=\(page)")
    APIClient.shared.request(request: request, decodeType: MovieResponse.self, completion: completion)
  }

  func search(query: String, page: Int, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
    let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
    let request = APIRequest(endpoint: "search/movie?query=\(encoded)&page=\(page)&include_adult=false")
    APIClient.shared.request(request: request, decodeType: MovieResponse.self, completion: completion)
  }
}
