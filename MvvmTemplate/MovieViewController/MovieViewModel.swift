//
//  MovieViewModel.swift
//  MvvmTemplate
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import Foundation

struct MovieViewModel {
    weak var datasource: GenericDataSource<[Movie]>?

    init(_ datasource: GenericDataSource<[Movie]>?) {
        self.datasource = datasource
    }

    public func fetchMovies() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.datasource?.data.value = Movie.stubbedList()
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
