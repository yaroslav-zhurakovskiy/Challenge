//
//  PlaceServiceModule.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import PainlessInjection


class FakePlaceServiceModule: Module {
    
    override func load() {
        define(PlaceService.self) { (args: ArgumentList) -> PlaceService in
            return FakePlaceService()
        }
    }
    
    
    override func loadingPredicate() -> ModuleLoadingPredicate {
        return FakeServicesPredicate()
    }
}

class LivePlaceServiceModule: Module {
    
    override func load() {
        define(PlaceService.self) { (args: ArgumentList) -> PlaceService in
            return GooglePlaceService(apiKey: "AIzaSyCU9z2s9VMjE_6i10T3JSNIeVezOCvLY4A")
        }
    }
    
    override func loadingPredicate() -> ModuleLoadingPredicate {
        return LiveServicesPredicate()
    }
}
