//
//  MovieViewModelTests.swift
//  MvvmTemplateTests
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import XCTest

@testable import MvvmTemplate

class MovieViewModelTests: XCTestCase {

    func testFetchWithNoService() {
        let service = MockedService()
        let dataSource: GenericDataSource<[Movie]>? = GenericDataSource(data: [])
        var viewModel = MovieViewModel(service, dataSource: dataSource)
        viewModel.service = nil

        // expected to not be able to fetch currencies
        viewModel.fetchMovies { result in
            var testResult: Bool
            switch result {
            case .failure(let error):
                testResult = error == .missingService
            case .success:
                testResult = false
            }
            
            XCTAssert(testResult, "ViewModel should not be able to fetch without service")
        }
    }
}

class MockedService: MovieFetcher {
    var list: [Movie]?
    func fetchMovies(_ completion: @escaping ((Result<[Movie], CoreError>) -> Void)) {
        if let list = list {
            completion(.success(list))
        } else {
            completion(.failure(.missingList))
        }

    }
}
