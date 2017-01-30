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


class StandardListsRouter: ListRouter {
    private let controller: ListController;
    init(controller: ListController) {
        self.controller = controller;
    }
    func showDetails(of place: Place) {
        let vc = DetailsController(place: place)
        self.controller.navigationController?.pushViewController(vc, animated: true)
    }
}
