//
//  ListView.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


protocol ListViewDelete: class {
    func onKeywordChange(newValue: String?)
    func onLoad()
    func onSelectPlace(at: Int)
}

protocol ListView: class {
    weak var delegate: ListViewDelete? { get set }
    func display(list: PlacesListViewModel)
    func display(error: String)
}
