//
//  FakePlaceService.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


class FakePlaceService: PlaceService {
    func fetch(keyword: String?, completion: (PlaceServiceFetchingResult) -> Void) {
        let processedKeyword = (keyword ?? "").lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if processedKeyword == "error" {
            completion(Result.Failure(.ServiceUnavailable))
        } else if processedKeyword == "no" {
            completion(Result.Failure(.NoPlacesFound))
        } else {
            if processedKeyword.characters.count > 0 {
                let places: [Place] = [
                    Place(displayText: "New York, USA"),
                    Place(displayText: "Tokyo, Japan"),
                    Place(displayText: "Madird, Spain"),
                    Place(displayText: "Moscow, Russia"),
                    Place(displayText: "Kiev, Ukraine")
                ]
                completion(Result.Success(places))
            } else {
                completion(Result.Success([]))
            }
        }
    }
}
