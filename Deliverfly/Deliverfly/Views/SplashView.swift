//
//  SplashView.swift
//  Deliverfly
//
//  Created by Neli Shahapuni on 5/10/24.
//

import SwiftUI

struct SplashView: View {
    @State private var animationValue = 0.5
    
    var body: some View {
        VStack {
            Image(.logo)
                .renderingMode(.template)
                .foregroundStyle(.white)
                .padding()
                .scaleEffect(animationValue)
            
            Text("Deliverfly")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .opacity(animationValue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.darkOrange, ignoresSafeAreaEdges: .all)
        .animation(.easeInOut(duration: 1.5), value: animationValue)
        .onAppear {
            animationValue = 1.0
        }
    }
}

#Preview {
    SplashView()
}
