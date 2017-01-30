//
//  PlaceService.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


enum PlaceServiceFetchingError: Error {
    case NoPlacesFound
    case ServiceUnavailable
}

typealias PlaceServiceFetchingResult = Result<[Place], PlaceServiceFetchingError>

protocol PlaceService {
    func fetch(keyword: String?, completion: (PlaceServiceFetchingResult) -> Void)
}
