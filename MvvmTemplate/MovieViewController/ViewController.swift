//
//  ViewController.swift
//  MvvmTemplate
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!

    let dataSource = MovieDataSource(data: [])
    lazy var viewModel: MovieViewModel = {
        let vm = MovieViewModel(dataSource: dataSource)
        return vm
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movie List"
        self.tableView.dataSource = dataSource

        viewModel.dataSource?.data.addObserverAndNotify(self, completionHandler: { [weak self] in
            self?.tableView.reloadData()
        })

        viewModel.fetchMovies { _ in }
    }
}
