//
//  StatusPreview.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/12/24.
//

import SwiftUI

struct StatusPreview: View {
    let status: Status
    
    var body: some View {
        image
        message
        description
    }
}

private extension StatusPreview {
    var image: some View {
        Image(status.rawValue)
            .foregroundStyle(.darkOrange)
            .padding()
    }
    
    var message: some View {
        Text(status.message)
            .font(.title)
            .fontWeight(.medium)
            .padding(.bottom, 5)
    }
    
    var description: some View {
        Text(status.description)
            .foregroundStyle(.gray)
            .multilineTextAlignment(.center)
            .lineSpacing(5)
            .padding(.horizontal)
    }
}

#Preview {
    StatusPreview(status: .error)
}
