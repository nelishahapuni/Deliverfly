//
//  Navigation.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/11/24.
//

import Foundation
import SwiftUI

class Navigation: ObservableObject {
    
    @Published var navPath = NavigationPath() // stack
    
    enum View: Hashable {
        case restaurant(info: Restaurant)
        case order(info: Binding<Order>, isOrdering: Bool = true)
        //status
        //history
    }
    
    func goTo(view: View) {
        navPath.append(view)
    }
    
    func goBack() {
        navPath.removeLast()
    }
    
    func goToRoot() {
        navPath.removeLast(navPath.count)
    }
}

extension Binding: Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}

extension Binding: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.hashValue)
    }
}
