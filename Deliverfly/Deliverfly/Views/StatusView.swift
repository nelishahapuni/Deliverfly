//
//  StatusView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/12/24.
//

import SwiftUI

struct StatusView: View {
    @EnvironmentObject private var navigation: Navigation
    let status: Status
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            StatusPreview(status: status)
            Spacer()
            doneButton
        }
        .padding()
    }
}

private extension StatusView {
        
    var doneButton: some View {
        Button {
            navigation.goToRoot()
        } label: {
            Text("Done".uppercased())
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60)
                .foregroundStyle(.white)
                .background(.darkOrange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    StatusView(status: .success)
}
