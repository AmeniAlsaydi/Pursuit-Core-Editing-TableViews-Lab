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
            print("here")
            print(groceries)
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
        
        groceries[0].insert(addedItem, at: 0) // should add them into Unpurchased
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        tableView.insertRows(at: [indexPath], with: .automatic)
//         HERE IS THE ISSUE 
    }
  

}

extension GroceryListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num of items in sections: \(groceries[section].count)")
        
        if section == 0 {
            return 1
        } else {
        return groceries[section].count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if groceries[indexPath.section].count != 0 {
            
                   let grocery = groceries[indexPath.section][indexPath.row]  // this should be empty
                   
                   cell.textLabel?.text = grocery.name
                   cell.detailTextLabel?.text = grocery.price.description
        } else {
            cell.textLabel?.text = "Item"
            cell.detailTextLabel?.text = "Price"
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("num of sections: \(groceries.count)")  // ✅ 2
        return groceries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Unpurchased"
        } else {
            return "Purchased"
        }
        //groceries[section].first?.status.rawValue
    }
    
}

