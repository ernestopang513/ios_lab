//
//  InfiniteScrollScreen.swift
//  componentesApp
//
//  Created by Ernesto Pang on 05/02/25.
//

import SwiftUI

struct InfiniteScrollScreen: View {
    
    @State private var numbers = Array(0...5)
    @State private var isLoading = false
    let columns = [GridItem(.flexible())]
    
    
    var body: some View {
        VStack {
            List {
                ForEach(numbers, id: \.self ) { number in
                    ListItem(number: number)
                        .onAppear {
                            if number == numbers.last {
//                                loadMore()\
                            }
                        }
                }
            }
        }
    }
    
    func loadMore() {
        guard !isLoading else { return }
        isLoading = true
//        DispatchQueue.main.asyncAfter
    }
}

struct ListItem: View {
    
    let number: Int
    
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/id/\(number + 50)/500/400")){ image in
            image.resizable()
                .scaledToFit()
                .frame(height:400)
                .cornerRadius(8)
        } placeholder: {
            Color.gray.opacity(0.3)
                .frame(height: 400)
                .cornerRadius(8)
        }
    }
}

#Preview {
    InfiniteScrollScreen()
}
