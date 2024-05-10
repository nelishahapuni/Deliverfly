//
//  RestaurantPreview.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI

struct RestaurantPreview: View {
    let image: ImageResource
    let name: String
    let items: String
    let rating: Double
    let time: Int
    
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
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    var restaurantName: some View {
        Text(name)
            .font(.title2)
            .foregroundStyle(.darkBlue)
    }
    
    var menuItems: some View {
        Text(items)
            .font(.subheadline)
            .foregroundStyle(.gray)
            .lineLimit(1)
    }
    
    var details: some View {
        HStack {
            Image(.star)
                .renderingMode(.template)
                .foregroundStyle(.darkOrange)
            Text(String(rating))
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
            Text("\(time) min")
                .fontWeight(.light)
                .foregroundStyle(.darkBlue)
        }
        .padding(.vertical)
    }
}

#Preview {
    RestaurantPreview(
        image: .inNOut,
        name: "In-N-Out Burger",
        items: "Double Double - Chocolate Shake - French Fries",
        rating: 5.0,
        time: 20
    )
    // format: control ^ + M
}
