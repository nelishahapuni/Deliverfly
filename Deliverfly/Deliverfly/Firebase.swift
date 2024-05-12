//
//  Firebase.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/12/24.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class Firebase: ObservableObject {
    let database = Database.database(url: "https://deliverfly-swiftui-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    func fetchData() async {
        let ids = ["100", "101", "102", "103"]        
        let foodsData = try? await database.child("Foods").getData()
        
        // write func decodeFood first, then the following:
        let foods = ids.reduce(into: [Food]()) { foods, id in
            foodsData?.decodeFood(id: id).map { foods.append($0) }
        }
        
        dump(foods)
    }
}

extension DataSnapshot {
    
    func decodeFood(id: String) -> Food? {
        guard let food = self.childSnapshot(forPath: id).value as? [String: AnyObject] else { return nil }
        
        let name = food["name"] as? String ?? ""
        let description = food["description"] as? String ?? ""
        let image = food["image"] as? String ?? ""
        let ingredients = (food["ingredients"] as? [String] ?? []).reduce(into: [Ingredient]()) { newArray, ingredient in
            Ingredient(rawValue: ingredient).map { newArray.append($0) }
        }
        let price = food["price"] as? Double ?? 0.0
        
        return Food(id: id, name: name, description: description, image: image, ingredients: ingredients, price: price)
    }
}
