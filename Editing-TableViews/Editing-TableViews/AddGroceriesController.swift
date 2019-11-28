//
//  AddGroceriesController.swift
//  Editing-TableViews
//
//  Created by Amy Alsaydi on 11/21/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class AddGroceriesController: UIViewController {
    
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var addPriceTextField: UITextField!
    
    var grocery: Grocery? // default is nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addItemTextField.delegate = self
        addPriceTextField.delegate = self
        
        grocery = Grocery(name: "item name", price: "2.00" )// , status: .unpurchased)
     // at this point grocery is the above 

    }
}

extension AddGroceriesController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
         textField.resignFirstResponder()
        
        if textField == addItemTextField {
            grocery?.name = textField.text ?? "no item name"
        }
        
        if textField == addPriceTextField {
            grocery?.price = textField.text ?? "unknown price"
        }
        
        return true
    }
    
}
