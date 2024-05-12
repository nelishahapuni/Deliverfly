//
//  ItemPreview.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/11/24.
//

import SwiftUI

struct ItemPreview: View {
    let item: Item
    
    var body: some View {
        HStack(alignment: .center) {
            itemImage
            VStack(alignment: .leading, spacing: 5) {
                itemName
                if item.extras.isEmpty {
                    itemDescription
                } else {
                    selectedExtras
                }
                Spacer()
                itemPrice
            }
        }
        .padding([.top, .horizontal])
    }
}

private extension ItemPreview {
    var itemImage: some View {
        Image(item.food.image)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.trailing)
    }
    
    var itemName: some View {
        Text(item.food.name)
            .font(.title3)
            .fontWeight(.bold)
            .kerning(1)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, 5)
    }
    
    var itemDescription: some View {
        Text("\(item.food.description)")
            .font(.subheadline)
            .foregroundStyle(.gray)
            .lineLimit(3)
    }
    
    var selectedExtras: some View {
        ForEach(item.extras, id: \.self) { extra in
            Text("+ \(extra)")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
    }
    
    var itemPrice: some View {
        HStack(alignment: .lastTextBaseline) {
            Text(item.food.price, format: .currency(code: "USD"))
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal, -5)
            if item.quantity > 1 {
                Text("x\(item.quantity) items")
                    .font(.subheadline)
                    .kerning(1)
            }
        }
        .padding(.bottom, 5)
    }
}

#Preview {
    ItemPreview(item: .previewData)
}
