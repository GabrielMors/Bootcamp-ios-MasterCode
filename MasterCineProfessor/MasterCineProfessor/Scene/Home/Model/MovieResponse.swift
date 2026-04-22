//
//  MovieResponse.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 20/04/26.
//

import Foundation

struct MovieResponse: Codable, Equatable {
  let page: Int
  let results: [Movie]
  let totalPages: Int
  let totalResults: Int

  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}

struct Movie: Codable, Equatable {
  let id: Int
  let title: String
  let posterPath: String?
  let releaseDate: String?
  let voteAverage: Double?

  var urlImage: String? {
    guard let posterPath, !posterPath.isEmpty,
          let baseImageURL = GetInfo.info(key: .imageBaseURL) as? String else { return nil }
    return "\(baseImageURL)/w342/\(posterPath)"
  }

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
  }
}
