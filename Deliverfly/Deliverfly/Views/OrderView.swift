//
//  OrderView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/11/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject private var navigation: Navigation
    @Binding var order: Order
    let isOrdering: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                backButton
                Text("Order")
                Spacer()
            }
            orderItemsList
            Divider()
                .padding()
            deliveryInfo
            orderTotal
            if isOrdering {
                placeOrder
            }
        }
        .padding(.horizontal)
    }
}

private extension OrderView {
    
    var backButton: some View {
        Button {
            navigation.goBack()
        } label: {
            Image(.backArrow)
                .frame(width: 50, height: 50)
                .background(.lightGray)
                .clipShape(Circle())
                .padding(.trailing)
        }
    }
    
    var orderItemsList: some View {
        List {
            ForEach(order.items, id: \.self) { item in
                ItemPreview(item: item)
            }
            .onDelete { indexSet in
                order.items.remove(atOffsets: indexSet)
            }
            .deleteDisabled(!isOrdering)
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
    }
    
    var deliveryInfo: some View {
        HStack {
            Text("Delivery")
            Spacer()
            if order.deliveryPrice.isZero {
                Text("Free")
            } else {
                Text(order.deliveryPrice, format: .currency(code: "USD"))
            }
        }
        .font(.subheadline)
        .foregroundStyle(.gray)
    }
    
    var orderTotal: some View {
        HStack {
            Text("Total")
            Spacer()
            Text(order.total, format: .currency(code: "USD"))
        }
        .font(.title)
        .padding(.top, 5)
    }
    
    var placeOrder: some View {
        Button {
            navigation.goToRoot()
        } label: {
            Text("Place order".uppercased())
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60)
                .foregroundStyle(order.items.isEmpty ? .gray : .white)
                .background(order.items.isEmpty ? .lightGray : .darkOrange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .disabled(order.items.isEmpty)
    }
}

#Preview {
    OrderView(order: .constant(.previewData), isOrdering: true)
        .environmentObject(Navigation())
}
