//
//  GooglePlaceService.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class GooglePlaceService: PlaceService {
    
    private let apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func fetch(keyword: String?, completion: @escaping (PlaceServiceFetchingResult) -> Void) {
        let input = (keyword ?? "").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(input)&key=\(self.apiKey)"
        Alamofire.request(url).responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value)
                if json["status"].stringValue == "OK" {
                    let jsonPredications = json["predictions"].arrayValue;
                    if jsonPredications.count > 0 {
                        let predications: [Place] = jsonPredications.map { GooglePlace(json: $0, service: self) }
                        completion(.Success(predications))
                    } else {
                        completion(.Failure(.NoPlacesFound))
                    }
                } else {
                    completion(.Failure(.ServiceError))
                }
            } else {
                completion(.Failure(.ServiceUnavailable))
            }
        }
    }
    
    func fetchInfo(placeID: String, completion: @escaping (String?) -> Void) {
        let url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeID)&key=\(self.apiKey)"
        Alamofire.request(url).responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value)
                completion(json.debugDescription)
            } else {
                completion(nil)
            }
        }

    }
}
