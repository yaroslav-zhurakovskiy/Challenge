//
//  DetailsController.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import UIKit


class DetailsController: UIViewController {
    
    private let place: Place!
    @IBOutlet weak var descriptionView: UITextView!
    
    init(place: Place) {
        self.place = place;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.place = nil
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Place Details"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        place.fetchInfo { info in
            self.descriptionView.text = info
        }
    }

}
