//
//  HomeView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var navigation: Navigation
    @EnvironmentObject private var firebase: Firebase
    
    var body: some View {
        if firebase.restaurants.isEmpty {
            ProgressView()
                .task {
                    await firebase.fetchData()
                }
        } else {
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
        ForEach(firebase.restaurants, id: \.self) { restaurant in
            Button {
                navigation.goTo(view: .restaurant(info: restaurant))
            } label: {
                RestaurantPreview(restaurant: restaurant)
            }
        }
    }
}

#Preview {
    HomeView()
}
