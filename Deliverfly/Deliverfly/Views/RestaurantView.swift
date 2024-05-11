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
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    backButton
                    Text("Restaurant")
                    Spacer()
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
        FoodView(food: item)
            .presentationDetents(item.ingredients.isEmpty ? [.fraction(0.63)] : [.fraction(0.93)])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(30)
    }
}

#Preview {
    RestaurantView(restaurant: .inNOut)
}
