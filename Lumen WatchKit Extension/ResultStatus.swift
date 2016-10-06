//
//  ReturnStatus.swift
//  Lumen
//
//  Created by Dewar Tan on 10/5/16.
//  Copyright © 2016 Dewar Tan. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case Success(T)
    case Failure(E)
    
    init(value: T) {
        self = .Success(value)
    }
    
    init(error: E) {
        self = .Failure(error)
    }
}
