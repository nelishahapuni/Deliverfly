//
//  HistoryView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/12/24.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject private var navigation: Navigation
    @EnvironmentObject private var firebase: Firebase
    @State private var selectedOrder: Order?
    @State private var loadingOrders = true
    
    var body: some View {
        VStack {
            HStack {
                backButton
                Text("History")
                Spacer()
            }
            .padding(.horizontal)
            Spacer()
            historyView
            Spacer()
        }
        .task {
            await firebase.fetchOrders()
        }
        .onDisappear {
            firebase.resetOrders()
            loadingOrders = true
        }
    }
}

extension HistoryView {
    @ViewBuilder var historyView: some View {
        if firebase.orders.isEmpty {
            if loadingOrders {
                ProgressView()
                    .task {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            loadingOrders = false
                        }
                    }
            } else {
                StatusPreview(status: .error)
            }
        } else {
            VStack {
                ScrollView {
                    ForEach(firebase.orders, id: \.self) { order in
                        VStack(alignment: .center) {
                            OrderPreview(order: order)
                            viewOrderButton(order: order)
                        }
                        .padding(.horizontal)
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
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
    
    @ViewBuilder func viewOrderButton(order: Order) -> some View {
        Button {
            selectedOrder = order
            if let selectedOrder = Binding<Order>($selectedOrder) {
                navigation.goTo(view: .order(info: selectedOrder, isOrdering: false))
            }
        } label: {
            Text("View Order")
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60)
                .foregroundStyle(.darkOrange)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.darkOrange, lineWidth: 2)
                )
        }
    }
}

#Preview {
    HistoryView()
}
