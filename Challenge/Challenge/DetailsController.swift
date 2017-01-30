//
//  DetailsController.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import UIKit


class DetailsController: UIViewController {
    
    private let viewModel: DetailsViewModel
    @IBOutlet weak var descriptionView: UITextView!
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = DetailsViewModel(title: "", description: "");
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = viewModel.title
        self.descriptionView.text = viewModel.description
    }

}
