//
//  Status.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/12/24.
//

import Foundation

enum Status: String {
    case success
    case error
    
    var message: String {
        switch self {
        case .success:
            return "Congratulations!"
        case .error:
            return "Aw Snap!"
        }
    }
    
    var description: String {
        switch self {
        case .success:
            return "Your order was successful,\n see confirmation in order history!"
        case .error:
            return "There was an issue,\n please make an order and try again!"
        }
    }
}
