//
//  RestaurantPreview.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI

struct RestaurantPreview: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            headerImage
            restaurantName
            menuItems
            details
        }
    }
}

private extension RestaurantPreview {
    var headerImage: some View {
        Image(.inNOut)
            .resizable()
            .scaledToFill()
            .frame(height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    var restaurantName: some View {
        Text("In-n-Out Burger")
            .font(.title2)
            .foregroundStyle(.darkBlue)
    }
    
    var menuItems: some View {
        Text("Double Double - Chocolate Shake - French Fries")
            .font(.subheadline)
            .foregroundStyle(.gray)
            .lineLimit(1)
    }
    
    var details: some View {
        HStack {
            Image(.star)
                .renderingMode(.template)
                .foregroundStyle(.darkOrange)
            Text(String(5.0))
                .bold()
                .foregroundStyle(.darkBlue)
            Image(.truck)
                .renderingMode(.template)
                .foregroundStyle(.darkOrange)
                .padding(.leading)
            Text("Free")
                .fontWeight(.light)
                .foregroundStyle(.darkBlue)
            Image(.clock)
                .renderingMode(.template)
                .foregroundStyle(.darkOrange)
                .padding(.leading)
            Text("\(20) min")
                .fontWeight(.light)
                .foregroundStyle(.darkBlue)
        }
        .padding(.vertical)
    }
}

#Preview {
    RestaurantPreview()
}
