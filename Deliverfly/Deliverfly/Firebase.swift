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
    @Published var orders: [Order] = []
    
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
    
    func fetchOrders() async {
        guard let ordersData = try? await database.child("Orders").getData().children.allObjects as? [DataSnapshot] else { return }
        let foodsData = try? await database.child("Foods").getData()

        await MainActor.run {
            orders = ordersData.reduce(into: [Order]()) { orders, data in
                // write func decodeOrder first, then the following:
                data.decodeOrder(id: data.key, foodsData: foodsData).map { orders.append($0) }
            }
        }
        
        dump(orders)
    }
    
    func resetOrders() {
        orders = []
    }
    
    func placeOrder(_ order: Order) async {
        let newOrder = database.child("Orders").child(String(order.id))
        
        do {
            try await newOrder.child("date").setValue(order.date)
            try await newOrder.child("restaurant").child("name").setValue(order.restaurant.name)
            try await newOrder.child("restaurant").child("image").setValue(order.restaurant.image)
            
            for (index, item) in order.items.enumerated() {
                let itemRef = newOrder.child("items").child(String(index))
                
                try await itemRef.child("id").setValue(item.food.id)
                try await itemRef.child("quantity").setValue(item.quantity)

                for (index, extra) in item.extras.enumerated() {
                    let extraRef = itemRef.child("extras").child(String(index))
                    try await extraRef.setValue(extra.rawValue)
                }
            }
            
            try await newOrder.child("deliveryPrice").setValue(order.deliveryPrice)
            try await newOrder.child("total").setValue(order.total)

        } catch {
            print(error)
        }
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
    
    func decodeOrder(id: String, foodsData: DataSnapshot?) -> Order? {
        guard let order = self.value as? [String: AnyObject] else { return nil }
        
        let date = order["date"] as? String ?? ""
        let restaurantName = order["restaurant"]?["name"] as? String ?? ""
        let restaurantImage = order["restaurant"]?["image"] as? String ?? ""
        let items = (order["items"] as? [AnyObject] ?? []).reduce(into: [Item]()) { newArray, item in
            let id = item["id"] as? String ?? ""
            guard let food = foodsData?.decodeFood(id: id) else { return }
            let quantity = item["quantity"] as? Int ?? 0
            let extras = (item["extras"] as? [String] ?? []).reduce(into: [Ingredient]()) { newArray, ingredient in
                Ingredient(rawValue: ingredient).map { newArray.append($0) }
            }
            newArray.append(Item(food: food, quantity: quantity, extras: extras))
        }
        let deliveryPrice = order["deliveryPrice"] as? Double ?? 0.0
        
        return Order(id: id, date: date, restaurant: Order.Restaurant(name: restaurantName, image: restaurantImage), items: items, deliveryPrice: deliveryPrice)
    }
}
