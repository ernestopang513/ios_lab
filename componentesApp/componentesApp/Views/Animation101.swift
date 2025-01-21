//
//  Animation101.swift
//  componentesApp
//
//  Created by Ernesto Pang on 20/01/25.
//
import SwiftUI

struct Animation101: View {
    
    @State private var isVisible = false
    
    var body: some View {
        VStack {
            Text("Animacion FadeIn")
                .font(.title)
            
            Spacer()
            Image("cube-outline").resizable().frame(width: 100, height: 100).background(Color.red)
                .scaleEffect(isVisible ? 1 : 0.5)
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0), value: isVisible)
                .opacity(isVisible ? 1 : 0)
            
            Spacer()
            Button("Toggle Fade") {
                            isVisible.toggle() // Cambia el estado para activar la animación
            }.padding()
        }
        
        Spacer()
        Spacer()
        
        
        .navigationTitle("Animation")
    }
}



#Preview {
    Animation101()
}
