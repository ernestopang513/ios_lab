//
//  ContentView.swift
//  WeSplit
//
//  Created by Ernesto Pang on 29/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    var body: some View {
        Form{
            Section{
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier  ?? "USD")).keyboardType(.decimalPad)
            }
        }
    }
}

#Preview {
    ContentView()
}
