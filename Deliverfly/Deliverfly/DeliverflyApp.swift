//
//  DeliverflyApp.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI
import FirebaseCore

@main
struct DeliverflyApp: App {
    @ObservedObject private var navigation = Navigation()
    @ObservedObject private var firebase: Firebase
    @State private var isSplash = true
    
    init() {
        FirebaseApp.configure()
        firebase = Firebase()
    }
    
    var body: some Scene {
        WindowGroup {
            if isSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isSplash = false
                        }
                    }
            } else {
                NavigationStack(path: $navigation.navPath) {
                    HomeView()
                        .navigationBarBackButtonHidden(true)
                        .navigationDestination(for: Navigation.View.self) { view in
                            switch view {
                            case .restaurant(let info):
                                RestaurantView(restaurant: info)
                                    .navigationBarBackButtonHidden(true)
                            case .order(let info, let isOrdering):
                                OrderView(order: info, isOrdering: isOrdering)
                                    .navigationBarBackButtonHidden(true)
                            }
                        }
                }
                .environmentObject(navigation)
                .environmentObject(firebase)
            }
        }
    }
}
