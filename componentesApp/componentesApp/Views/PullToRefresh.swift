//
//  PullToRefresh.swift
//  componentesApp
//
//  Created by Ernesto Pang on 22/01/25.
//

import SwiftUI

struct PullToRefresh: View {
    @State private var isRefreshing = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20){
                Text("Pull to refresh")
                    .font(.largeTitle)
                    .padding()
                ForEach(1...20, id: \.self) { item in
                    Text("Item \(item)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }.padding()
        }.refreshable {
            await simulateRefresh()
        }
        .background(Color(UIColor.systemBackground))
    }
    private func simulateRefresh() async {
            isRefreshing = true
            print("Refreshing started...")
            try? await Task.sleep(nanoseconds: 5_000_000_000) // Simula 5 segundos de espera
            print("Refresh completed")
            isRefreshing = false
        }
}

#Preview {
    PullToRefresh()
}
