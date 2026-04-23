//
//  MovieDetailService.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import Foundation

final class MovieDetailService {
  func fetchMovieDetail(id: Int, completion: @escaping (Result<MovieDetailResponse, NetworkError>) -> Void) {
    let request = APIRequest(
      endpoint: "movie/\(id)?append_to_response=credits,videos,recommendations",
      httpMethod: .get
    )

    APIClient.shared.request(request: request, decodeType: MovieDetailResponse.self, completion: completion)
  }
}
