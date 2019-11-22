//
//  Grocery.swift
//  Editing-TableViews
//
//  Created by Amy Alsaydi on 11/21/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import Foundation

enum ItemStatus: String, CaseIterable  {
    case purchased
    case unpurchased
}

struct Grocery{
    
    var name: String
    var price: Double
    var status: ItemStatus
    
    static func createEmptyArray() -> [[Grocery]] {
        let groceries = Array(repeating: [Grocery](), count: ItemStatus.allCases.count)
        
        return groceries
    }
    
}
