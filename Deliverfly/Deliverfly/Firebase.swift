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
    @Published var restaurants: [Restaurant] = []
    
    func fetchData() async {
        let ids = ["1", "2", "3"]
        let restaurantsData = try? await database.child("Restaurants").getData()
        let foodsData = try? await database.child("Foods").getData()
        
        await MainActor.run {
            restaurants = ids.reduce(into: [Restaurant]()) { restaurant, id in
                // write func decodeRestaurant first, then the following:
                restaurantsData?.decodeRestaurant(id: id, foodsData: foodsData).map { restaurant.append($0) }
            }
        }
        
        dump(restaurants)
    }
}

extension DataSnapshot {
    
    func decodeRestaurant(id: String, foodsData: DataSnapshot?) -> Restaurant? {
        guard let restaurant = self.childSnapshot(forPath: id).value as? [String: AnyObject] else { return nil }
        
        let name = restaurant["name"] as? String ?? ""
        let description = restaurant["description"] as? String ?? ""
        let image = restaurant["image"] as? String ?? ""
        let rating = restaurant["rating"] as? Double ?? 0.0
        let time = restaurant["time"] as? Int ?? 0
        let foods: [Food] = (restaurant["foods"] as? [String] ?? []).reduce(into: [Food]()) { newArray, id  in
            foodsData?.decodeFood(id: id).map { newArray.append($0) }
        }
        
        return Restaurant(id: id, name: name, description: description, image: image, rating: rating, time: time, foods: foods)
    }
    
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
