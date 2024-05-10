//
//  DeliverflyApp.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI

@main
struct DeliverflyApp: App {
    @State private var isSplash = true

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
                Text("Home")
            }
        }
    }
}
