//
//  ListPresenter.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


class ListPresenter: ListViewDelete {
    private weak var view: ListView!
    private let service: PlaceService
    private let router: ListRouter
    private var lastResult: PlaceServiceFetchingResult?
    
    init(view: ListView, service: PlaceService, router: ListRouter) {
        self.service = service
        self.router = router
        self.view = view
        view.delegate = self
    }
    
    func onLoad() {
        self.view.display(list: PlacesListViewModel(places: []))
        self.view.display(error: "In order to obtain places, please, use the field.")
    }
    
    func onKeywordChange(newValue: String?) {
        self.view.display(error: "")
        self.view.display(list: PlacesListViewModel(places: []))
        
        self.service.fetch(keyword: newValue) { result in
            self.lastResult = result
            switch result {
            case .Success(let places):
                self.view.display(error: "")
                self.view.display(list: PlacesListViewModel(places: places))
            case .Failure(let error):
                self.view.display(list: PlacesListViewModel(places: []))
                switch error {
                case .NoPlacesFound:
                    self.view.display(error: "No places were found.")
                case .ServiceUnavailable:
                    self.view.display(error: "Service is unavailable.")
                case .ServiceError:
                    self.view.display(error: "Service error.")
                }
            }
        }
    }
    
    func onSelectPlace(at index: Int) {
        if let result = self.lastResult {
            if case .Success(let places) = result {
                let place = places[index]
                self.router.showDetails(of: place)
            }
        }
    }
}
