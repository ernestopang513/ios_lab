//
//  ContentView.swift
//  Moonshot
//
//  Created by Ernesto Pang on 06/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
            NavigationLink("Tap me"){
                Text("Detail View")
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
