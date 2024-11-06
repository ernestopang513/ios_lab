//
//  ContentView.swift
//  Moonshot
//
//  Created by Ernesto Pang on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(.fondo)
//                .imageScale(.large)
//                .foregroundStyle(.tint)
            VStack{
                Text("Hello, world!")
                    .foregroundColor(.white)
                Text("Hola")
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
