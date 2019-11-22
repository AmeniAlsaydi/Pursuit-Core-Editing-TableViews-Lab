//
//  ViewController.swift
//  Editing-TableViews
//
//  Created by Amy Alsaydi on 11/21/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class GroceryListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groceries = [[Grocery]]() {
        didSet {
            tableView.reloadData() // not sure if ill need this
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        groceries = Grocery.createEmptyArray()
        tableView.dataSource = self
    }


}

extension GroceryListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceries[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        
        let grocery = groceries[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = grocery.name
        cell.detailTextLabel?.text = grocery.price.description
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groceries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        groceries[section].first?.status.rawValue
    }
    
}

