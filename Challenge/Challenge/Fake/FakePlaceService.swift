//
//  FakePlaceService.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


struct FakePlace: Place {
    let name: String

    func fetchInfo(completion: @escaping (String?) -> Void) {
        completion("Fake Place Info")
    }
}

class FakePlaceService: PlaceService {
    func fetch(keyword: String?, completion: @escaping (PlaceServiceFetchingResult) -> Void) {
        let processedKeyword = (keyword ?? "").lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        if processedKeyword == "error" {
            completion(Result.Failure(.ServiceUnavailable))
        } else if processedKeyword == "no" {
            completion(Result.Failure(.NoPlacesFound))
        } else {
            if processedKeyword.characters.count > 0 {
                let places: [Place] = [
                    FakePlace(name: "New York, USA"),
                    FakePlace(name: "Tokyo, Japan"),
                    FakePlace(name: "Madird, Spain"),
                    FakePlace(name: "Moscow, Russia"),
                    FakePlace(name: "Kiev, Ukraine")
                ]
                completion(Result.Success(places))
            } else {
                completion(Result.Success([]))
            }
        }
    }
}
