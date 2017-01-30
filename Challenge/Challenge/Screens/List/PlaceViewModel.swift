//
//  PlaceViewModel.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


struct PlaceViewModel {
    private let place: Place;

    init(place: Place) {
        self.place = place
    }
    
    var displayText: String {
        return place.name
    }
}

struct PlacesListViewModel {
    private var models: [PlaceViewModel];

    init(places: [Place]) {
        models = places.map { PlaceViewModel(place: $0) }
    }
    
    var numberOfPlaces: Int {
        return models.count
    }
    
    func model(at index: Int) -> PlaceViewModel {
        return models[index]
    }
}
