//
//  MovieDataSource.swift
//  MvvmTemplate
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import UIKit

class MovieDataSource: GenericDataSource<[Movie]>, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "justACell", for: indexPath)

        let cellData = data.value[indexPath.row]
        cell.textLabel?.text = cellData.title

        return cell
    }
}
