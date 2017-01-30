    //
//  ListController.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import UIKit


class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate,  UITextFieldDelegate, ListView {
    
    var presenter: ListPresenter?
    
    // MARK: ListView
    weak var delegate: ListViewDelete?
    
    func display(list: PlacesListViewModel) {
        self.list = list;
        self.tableView.reloadData()
    }
    
    func display(error: String) {
        self.errorLabel.text = error
    }
    
    // MARK: UIViewController events
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate?.onLoad()
        
        self.tableView.tableFooterView = UIView()
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.numberOfPlaces
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        let model = list.model(at: indexPath.row)
        cell?.textLabel?.text = model.displayText
        
        return cell!
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.keywordField.resignFirstResponder()
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.delegate?.onSelectPlace(at: indexPath.row)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func processKeywordChanged(_ sender: UITextField) {
        self.delegate?.onKeywordChange(newValue: sender.text)
    }
    
    // MARK: Internal State
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet  weak var keywordField: UITextField!
    @IBOutlet  weak var errorLabel: UILabel!
    private var list: PlacesListViewModel!
}
