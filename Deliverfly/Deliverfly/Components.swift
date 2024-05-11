//
//  Components.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/11/24.
//

import SwiftUI

extension View {
    var backButtonView: some View {
        Image(.backArrow)
            .frame(width: 50, height: 50)
            .background(.lightGray)
            .clipShape(Circle())
            .padding(.trailing)
    }
}
