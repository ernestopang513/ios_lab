//
//  ModalScreen2.swift
//  componentesApp
//
//  Created by Ernesto Pang on 22/01/25.
//

import SwiftUI

struct ModalScreen2: View {
    @State private var isVisible = false // Estado para mostrar u ocultar el modal
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {
        ZStack {
            VStack {
                // Título principal
                Text("Modal")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)

                // Botón para abrir el modal
                Button(action: {
                    isVisible = true
                }) {
                    Text("Abrir Modal")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 20)

                // Elemento rojo centrado
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .padding(.vertical, 40)
                
                Spacer()
            }

            // Modal
            if isVisible {
                // Fondo semitransparente
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        // Cerrar el modal al tocar fuera
                        isVisible = false
                    }

                // Contenido del modal
                VStack {
                    Text("Modal content")
                        .font(.title2)
                        .bold()
                        .padding()

                    Spacer()

                    Button(action: {
                        isVisible = false
                    }) {
                        Text("Cerrar Modal")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
                .frame(width: screenWidth * 0.6, height: screenHeight * 0.4)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 10)
                .padding(.top, screenHeight * 0.2)
            }
        }
    }
}

#Preview {
    ModalScreen2()
}
