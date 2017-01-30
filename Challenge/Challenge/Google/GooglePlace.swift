//
//  GooglePlace.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import SwiftyJSON


class GooglePlace: Place {
    let name: String
    private let placeID: String
    private let service: GooglePlaceService
    
    
    init(json: JSON, service: GooglePlaceService) {
        self.name = json["description"].stringValue
        self.placeID = json["place_id"].stringValue
        self.service = service
    }
    
    func fetchInfo(completion: @escaping (String?) -> Void) {
        self.service.fetchInfo(placeID: self.placeID, completion: completion)
    }
}
