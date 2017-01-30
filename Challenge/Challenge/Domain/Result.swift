//
//  Result.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


enum Result<ValueType, ErrorType: Error> {
    case Success(ValueType)
    case Failure(ErrorType)
}
