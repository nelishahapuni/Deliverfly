//
//  HomeView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                HStack {
                    historyButton
                    deliveryAddress
                    Spacer()
                }
                restaurants
                restaurantsList
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
}

private extension HomeView {
    
    var historyButton: some View {
        Button {
            // go to History
        } label: {
            Image(.history)
                .padding()
                .background(.lightGray)
                .clipShape(Circle())
        }
    }
    
    var deliveryAddress: some View {
        VStack(alignment: .leading) {
            Text("DELIVER TO")
                .font(.caption)
                .bold()
                .foregroundStyle(.darkOrange)
            Text("16 Halabyan St, Yerevan 0038")
                .font(.footnote)
                .foregroundStyle(.darkGray)
        }
        .padding()
    }
    
    var restaurants: some View {
        Text("Restaurants")
            .font(.title3)
            .padding(.vertical)
    }
    
    var restaurantsList: some View {
        VStack {
            RestaurantPreview(
                image: .inNOut,
                name: "In-N-Out Burger",
                items: "Double Double - Chocolate Shake - French Fries",
                rating: 5.0,
                time: 20
            )
            RestaurantPreview(
                image: .fiveGuys,
                name: "Five Guys",
                items: "Cheeseburger - Fries - Milkshake - Sandwich",
                rating: 4.7,
                time: 45
            )
            RestaurantPreview(
                image: .subway,
                name: "Subway",
                items: "Wrap - Footlong - Salad - Cookie",
                rating: 3.5,
                time: 50
            )
        }
    }
}

#Preview {
    HomeView()
}
