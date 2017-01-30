//
//  ListModule.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import PainlessInjection


class ListModule: Module {
    
    override func load() {
        define(ListController.self) { (args: ArgumentList) -> ListController in
            
            let controller = ListController(nibName: nil, bundle: nil);
            let router: ListRouter = StandardListsRouter(controller: controller)
            let service: PlaceService = self.resolve()
            controller.presenter = ListPresenter(view: controller, service: service, router: router)
            
            return controller
        }
    }
}
