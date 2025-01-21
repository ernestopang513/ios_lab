//
//  ContentView.swift
//  componentesApp
//
//  Created by Ernesto Pang on 20/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    NavigationLink(destination: Animation101()) {
                        Label("Animation 101", systemImage: "cube")
                    }
                    NavigationLink(destination: Animation102()) {
                        Label("Animation 102", systemImage: "rectangle.stack")
                    }
//                    NavigationLink(destination: DetailView()) {
//                        Label("Animation 102", systemImage: "list.bullet")
//                    }
                })
                Section(content: {
                    NavigationLink(destination: Animation101()) {
                        Label("Pull to refresh", systemImage: "arrow.clockwise")
                    }
                    NavigationLink(destination: Animation101()) {
                        Label("Section List", systemImage: "list.bullet")
                    }
                    NavigationLink(destination: DetailView()) {
                        Label("Modal", systemImage: "square.on.square")
                    }
                    NavigationLink(destination: DetailView()) {
                        Label("InfiniteScroll", systemImage: "square.and.arrow.down")
                    }
                    NavigationLink(destination: DetailView()) {
                        Label("Slides", systemImage: "snow")
                    }
                    NavigationLink(destination: DetailView()) {
                        Label("Themes", systemImage: "flask")
                    }
                })
                Section(content: {
                    NavigationLink(destination: Animation101()) {
                        Label("Switches", systemImage: "switch.2")
                    }
                    NavigationLink(destination: Animation101()) {
                        Label("Alerts", systemImage: "exclamationmark.circle")
                    }
                    NavigationLink(destination: DetailView()) {
                        Label("TexInputs", systemImage: "doc")
                    }
                })
            }
            .navigationTitle("Menú Principal")
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Esta es una pantalla de detalle")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationTitle("Detalle")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
