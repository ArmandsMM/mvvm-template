//
//  MovieFetcherService.swift
//  MvvmTemplate
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import Foundation

enum CoreError: Swift.Error {
    case missingService
    case missingList
}

class MovieFetcherService: MovieFetcher {
    static var shared = MovieFetcherService()
    
    func fetchMovies(_ completion: @escaping ((Result<[Movie], CoreError>) -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            completion(.success(Movie.stubbedList()))
        }
    }
}
