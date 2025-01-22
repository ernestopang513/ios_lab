//
//  ModalScreen.swift
//  componentesApp
//
//  Created by Ernesto Pang on 22/01/25.
//

import SwiftUI

struct ModalScreen: View {
    @State private var isVisible = false
    let colors = ColorScheme() // Simula el ThemeContext
    
    var body: some View {
        VStack {
            // Título principal
            Text("Modal")
                .font(.largeTitle)
                .padding(.top, 40)

            // Botón para abrir el modal
            Button(action: {
                isVisible = true
            }) {
                Text("Abrir Modal")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }

            // Caja roja
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .padding(.vertical, 40)

            Spacer()
        }
        .sheet(isPresented: $isVisible) {
            ModalView(isVisible: $isVisible, colors: colors)
        }
        .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
    }
}

// Vista del Modal
struct ModalView: View {
    @Binding var isVisible: Bool
    let colors: ColorScheme

    var body: some View {
        ZStack {
            // Fondo semitransparente
            Color.black.opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            // Contenedor del contenido del modal
            VStack {
//                Spacer()

                VStack {
                    // Título dentro del modal
                    Text("Modal content")
                        .font(.headline)
                        .padding()

//                    Divider()

                    // Botón para cerrar el modal
                    Button(action: {
                        isVisible = false
                    }) {
                        Text("Cerrar Modal")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 16)
                    }
                }
                .background(colors.cardBackground)
                .cornerRadius(10)
                .padding()
//                .frame(maxWidth: UIScreen.main.bounds.width * 0.6)
                .frame(width: 250, height: 250)
                
            }
        }
    }
}

// Simula el ThemeContext con un esquema de colores
struct ColorScheme {
    let cardBackground = Color(UIColor.secondarySystemBackground)
}

#Preview {
    ModalScreen()
}
