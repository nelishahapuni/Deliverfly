//
//  Item.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/11/24.
//

import Foundation
import SwiftUI

struct Item: Hashable {
    let food: Food
    let quantity: Int
    let extras: [Ingredient]
}

extension Item {
    static var previewData: Item {
        Item(food: .doubleDouble,
             quantity: 2,
             extras: [.ketchup, .onion, .cheese]
        )
    }
}

extension Array where Element == Item {
    static var previewDataArray: [Item] {
        [Item(food: .doubleDouble,
              quantity: 2,
              extras: [.ketchup, .onion, .cheese]),
         Item(food: .doubleDouble,
              quantity: 1,
              extras: [.tomato, .ketchup, .onion])]
    }
}
