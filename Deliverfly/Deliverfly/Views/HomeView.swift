//
//  HomeView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI

struct HomeView: View {
    let list: [Restaurant] = .restaurants

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
        ForEach(list, id: \.self) { restaurant in
            Button {
               // go to restaurant
            } label: {
                RestaurantPreview(restaurant: restaurant)
            }
        }
    }
}

#Preview {
    HomeView()
}
