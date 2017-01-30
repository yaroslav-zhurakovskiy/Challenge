//
//  PlaceViewModel.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


struct PlaceViewModel {
    init(place: Place) {
        self.place = place
    }
    
    var displayText: String {
        return place.displayText
    }
    
    private let place: Place;
}

struct PlacesListViewModel {
    init(places: [Place]) {
        models = places.map { PlaceViewModel(place: $0) }
    }
    
    var numberOfPlaces: Int {
        return models.count
    }
    
    func model(at index: Int) -> PlaceViewModel {
        return models[index]
    }
    
    private var models: [PlaceViewModel];
}
