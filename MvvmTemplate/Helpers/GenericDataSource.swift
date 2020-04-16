//
//  GenericDataSource.swift
//  MvvmTemplate
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import Foundation

class GenericDataSource<T>: NSObject {
    var data: DynamicValue<T>
    init(data: T) {
        self.data = DynamicValue(data)
    }
}
