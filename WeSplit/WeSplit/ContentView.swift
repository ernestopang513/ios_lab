//
//  ContentView.swift
//  WeSplit
//
//  Created by Ernesto Pang on 29/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople+1)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var totalAmountWithTip: Double {
        
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier  ?? "USD")).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(1..<25){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much do you want to tip?"){
//                    Text("How much do you want to tip?")
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                                }.pickerStyle(.navigationLink)
                }
                Section("Amount per person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Total amount"){
                    Text(totalAmountWithTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

