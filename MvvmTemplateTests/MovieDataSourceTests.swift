//
//  MovieDataSourceTests.swift
//  MvvmTemplateTests
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import Foundation
import XCTest

@testable import MvvmTemplate

class MovieDataSourceTests: XCTestCase {
    var dataSource : MovieDataSource!

    override func setUp() {
        super.setUp()
        dataSource = MovieDataSource(data: [])
    }

    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }

    func testValueInDataSource() {

        // giving data value
        let firstMovie = Movie(title: "some title", address: "address0")
        let secondMovie = Movie(title: "different title", address: "address1")

        dataSource.data.value = [firstMovie, secondMovie]

        let tableView = UITableView()
        tableView.dataSource = dataSource

        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected no cell in table view")
    }
}
