//
//  Place.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import Foundation


protocol Place {
    var name: String { get }
    func fetchInfo(completion: @escaping (String?) -> Void)
}
