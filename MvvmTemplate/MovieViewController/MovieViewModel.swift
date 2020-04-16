//
//  MovieViewModel.swift
//  MvvmTemplate
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import Foundation

protocol MovieFetcher: class {
    func fetchMovies(_ completion: @escaping ((Result<[Movie], CoreError>) -> Void))
}

struct MovieViewModel {
    weak var dataSource: GenericDataSource<[Movie]>?
    weak var service: MovieFetcher?

    init(_ service: MovieFetcher = MovieFetcherService.shared, dataSource: GenericDataSource<[Movie]>?) {
        self.dataSource = dataSource
        self.service = service
    }

    public func fetchMovies(_ completion: @escaping ((Result<Bool, CoreError>) -> Void)) {
        guard let service = service else {
            completion(.failure(.missingService))
            return
        }

        service.fetchMovies { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let list):
                self.dataSource?.data.value = list
                completion(.success(true))
            }
        }
    }
}

extension Movie {
    static func stubbedList() -> [Movie] {
        [
            .init(title: "Hello from Mars", address: "https://google.com"),
            .init(title: "Rage", address: "https://google.com"),
            .init(title: "Swiftly running to glory", address: "https://google.com")
        ]
    }
}
