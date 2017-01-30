//
//  FakeServicesPredicate.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import PainlessInjection


class FakeServicesPredicate: ModuleLoadingPredicate {
    func shouldLoadModule() -> Bool {
        if let mode = ProcessInfo.processInfo.environment["APP_MODE"] {
            return mode == "FAKE"
        }
        return false
    }
}
