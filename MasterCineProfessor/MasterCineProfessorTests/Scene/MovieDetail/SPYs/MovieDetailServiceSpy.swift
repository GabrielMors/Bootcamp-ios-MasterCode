//
//  MovieDetailServiceSpy.swift
//  MasterCineProfessor
//
//  Created by Marcello Pontes Domingos on 20/05/26.
//

import Foundation
@testable import MasterCineProfessor

final class MovieDetailServiceSpy: MovieDetailServiceProtocol {
    var result: Result<MovieDetailResponse, NetworkError>?
    
    func fetchMovieDetail(id: Int,
                          completion: @escaping (Result<MovieDetailResponse, NetworkError>) -> Void) {
        guard let result else {
            fatalError("resposta mal configurada, ATENÇÃO")
        }
        completion(result)
    }
}
