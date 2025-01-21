//
//  Animation101.swift
//  componentesApp
//
//  Created by Ernesto Pang on 20/01/25.
//
import SwiftUI

struct Animation101: View {
    var body: some View {
        VStack {
            Text("Animacion FadeIn")
                .font(.title)
            
            Image("cube-outline").resizable().frame(width: 50, height: 50).background(Color.red)
        }
        Spacer()
        
        
        .navigationTitle("Animation")
    }
}



#Preview {
    Animation101()
}
