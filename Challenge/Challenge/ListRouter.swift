//
//  ListRouter.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


protocol ListRouter {
    func showDetails(of place: Place)
}


class NoListRouter: ListRouter {
    func showDetails(of place: Place) {
        print(place.displayText)
    }
}
