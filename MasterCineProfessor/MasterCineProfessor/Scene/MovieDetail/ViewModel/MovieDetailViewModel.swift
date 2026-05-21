//
//  MovieDetailViewModel.swift
//  MasterCineProfessor
//
//  Created by Caio Fabrini on 22/04/26.
//

import Foundation

struct HeaderViewData {
    let title: String
    let subtitle: String
    let posterURL: String?
    let backdropURL: String?
}

enum MovieDetailRow {
    case header(HeaderViewData)
    case overview(description: String)
    case error(message: String)
}

protocol MovieDetailViewModelProtocol: AnyObject {
    func didUpdateMovies()
    func didChangeLoading(start: Bool)
}

final class MovieDetailViewModel {
    
    private var service: MovieDetailServiceProtocol
    private var movieId: Int
    private var rows: [MovieDetailRow] = []
    weak var delegate: MovieDetailViewModelProtocol?
    
    init(movieId: Int, service: MovieDetailServiceProtocol = MovieDetailService()) {
        self.movieId = movieId
        self.service = service
    }
    
    func fetchMovieDetail() {
        delegate?.didChangeLoading(start: true)
        service.fetchMovieDetail(id: movieId) { [weak self] result in
            guard let self else { return }
            delegate?.didChangeLoading(start: false)
            switch result {
            case .success(let success):
                rows = buildRows(movieDetail: success)
            case .failure(let failure):
                print("failure")
                rows = [.error(message: failure.errorDescription ?? "Erro desconhecido")]
            }
            delegate?.didUpdateMovies()
        }
    }
    
    var numberOfRowsInSection: Int {
        return rows.count
    }
    
    func loadCurrentMovieDetail(at index: Int) -> MovieDetailRow {
        return rows[index]
    }
    
    private func buildRows(movieDetail: MovieDetailResponse) -> [MovieDetailRow] {
        var result: [MovieDetailRow] = []
        
        let headerData = HeaderViewData(title: movieDetail.title,
                                        subtitle: buildSubtitle(movieDetail),
                                        posterURL: movieDetail.posterURL,
                                        backdropURL: movieDetail.backdropURL)
        
        result.append(.header(headerData))
        
        let overview = (movieDetail.overview ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if !overview.isEmpty {
            result.append(.overview(description: overview))
        }
        
        return result
    }
    
    private func buildSubtitle(_ detail: MovieDetailResponse) -> String {
        
        let year = releaseYear(from: detail.releaseDate)
        let runtime = runtimeText(from: detail.runtime)
        let rating = ratingText(from: detail.voteAverage)
        
        return [year, runtime, rating]
            .filter { !$0.isEmpty }
            .joined(separator: " • ")
    }
    
    private func releaseYear(from date: String?) -> String {
        guard let date, date.count >= 4 else { return "" }
        return String(date.prefix(4))
    }
    
    private func runtimeText(from runtime: Int?) -> String {
        guard let runtime, runtime > 0 else { return "" }
        return "\(runtime) min"
    }
    
    private func ratingText(from vote: Double?) -> String {
        guard let vote else { return "" }
        return String(format: "⭐️ %.1f", vote)
    }
    
}
