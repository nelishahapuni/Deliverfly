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
        //order
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
