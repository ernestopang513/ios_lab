//
//  ContentView.swift
//  WeSplit
//
//  Created by Ernesto Pang on 29/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier  ?? "USD")).keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(1..<25){
                            Text("\($0) people")
                        }
                    
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier  ?? "USD")).keyboardType(.decimalPad)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
