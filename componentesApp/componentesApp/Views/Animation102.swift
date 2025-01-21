//
//  Animation102.swift
//  componentesApp
//
//  Created by Ernesto Pang on 21/01/25.
//

import SwiftUI

struct Animation102: View {
    
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
    
    var body: some View {
        Rectangle()
            .fill(Color.cyan)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(DragGesture()
                .onChanged { gesture in
                    offset = CGSize(width: lastOffset.width + gesture.translation.width,
                                    height: lastOffset.height + gesture.translation.height)
                }
                .onEnded { _ in
                    lastOffset = offset
                }
            )
    }
}

#Preview {
    Animation102()
}
