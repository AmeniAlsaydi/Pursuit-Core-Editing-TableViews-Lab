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
        groceries = Grocery.createEmptyArray() // [[], []]
        tableView.dataSource = self
        print(groceries)
    }

    @IBAction func addNewItem(segue: UIStoryboardSegue) {
    
        guard let addGroceryVC = segue.source as? AddGroceriesController, let addedItem = addGroceryVC.grocery else {fatalError( "failed to access AddGroceriesController")}
        
        groceries[0].insert(addedItem, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    
    
    

}

extension GroceryListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num of items in sections: \(groceries[section].count)")
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
        print("num of sections: \(groceries.count)")
        return groceries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        groceries[section].first?.status.rawValue
    }
    
}

