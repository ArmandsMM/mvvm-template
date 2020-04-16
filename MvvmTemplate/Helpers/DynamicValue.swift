//
//  DynamicValue.swift
//  MvvmTemplate
//
//  Created by armands.mikanovskis on 16/04/2020.
//  Copyright © 2020 armands.mikanovskis. All rights reserved.
//

import Foundation

typealias CompletionHandler = (() -> Void)

class DynamicValue<T>: NSObject {
    var value: T {
        didSet {
            notify()
        }
    }

    private var observers = [String: CompletionHandler]()

    init(_ value: T) {
        self.value = value
    }

    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }

    public func addObserverAndNotify(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        addObserver(observer, completionHandler: completionHandler)
        notify()
    }

    private func notify() {
        observers.forEach { $0.value() }
    }

    deinit {
        observers.removeAll()
    }
}
