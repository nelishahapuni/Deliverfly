//
//  RestaurantView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/11/24.
//

import SwiftUI

struct RestaurantView: View {
    @EnvironmentObject private var navigation: Navigation
    @State private var selectedFood: Food?
    @State private var hasCartItems = false
    @State private var order: Order
    let restaurant: Restaurant
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        self.order = Order(id: String(Int.random(in: 10000..<99999)),
                           date: Date().formatted(.dateTime.day(.twoDigits).month(.wide).year(.defaultDigits)),
                           restaurant: .init(name: restaurant.name, image: restaurant.image),
                           items: [],
                           deliveryPrice: 0.0)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    backButton
                    Text("Restaurant")
                    Spacer()
                    cartButton
                }
                restaurantImage
                nameText
                descriptionText
                menuText
                foodsGrid
            }
            .padding(.horizontal)
        }
        .sheet(item: $selectedFood) { item in
            foodView(item)
        }
        .onChange(of: order.items.isEmpty) {
            withAnimation(.easeInOut(duration: 0.3)) {
                hasCartItems.toggle()
            }
        }
    }
}

private extension RestaurantView {
    
    var backButton: some View {
        Button {
            navigation.goBack()
        } label: {
            backButtonView
        }
    }
    
    var cartButton: some View {
        Button {
            navigation.goTo(view: .order(info: $order))
        } label: {
            Image(.bag)
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundStyle(hasCartItems ? .white : .gray)
                .background(hasCartItems ? .darkBlue : .lightGray)
                .clipShape(Circle())
                .overlay(alignment: .topTrailing) {
                    if hasCartItems {
                        Text(String(order.items.count))
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                            .background(.darkOrange)
                            .clipShape(Circle())
                            .offset(y: -5)
                            .transition(.scale)
                    }
                }
        }
        .disabled(!hasCartItems)
    }
    
    var restaurantImage: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.vertical)
            .allowsHitTesting(false)
    }
    
    var nameText: some View {
        Text(restaurant.name)
            .font(.title2)
            .bold()
            .foregroundStyle(.darkBlue)
            .padding(.vertical, 5)
    }
    
    var descriptionText: some View {
        Text(restaurant.description)
            .font(.subheadline)
            .lineSpacing(10)
            .foregroundStyle(.gray)
    }
    
    var menuText: some View {
        Text("Menu")
            .font(.title3)
            .padding(.vertical)
    }
    
    var foodsGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 60) {
            ForEach(restaurant.foods, id: \.self) { food in
                Button {
                    selectedFood = food
                } label: {
                    FoodPreview(food: food)
                }
            }
        }
    }
    
    @ViewBuilder func foodView(_ item: Food) -> some View {
        FoodView(orderItems: $order.items, food: item)
            .presentationDetents(item.ingredients.isEmpty ? [.fraction(0.63)] : [.fraction(0.93)])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(30)
    }
}

#Preview {
    RestaurantView(restaurant: .inNOut)
}
