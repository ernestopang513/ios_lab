//
//  ContentView.swift
//  BetterRest
//
//  Created by Ernesto Pang on 18/09/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 2
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack{
            
            
            Form {
                
//                VStack( alignment: .leading, spacing: 0) {
                Section{
                    Text("When do you want to wake up?")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute )
                        .labelsHidden()
                        .padding(.top, 20)
                }
                Section{
//                VStack(alignment: .leading, spacing: 0){
                    Text("Desired amount of sleep")
                        .font(.headline)
                        .padding(.top, 20)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25 )
                        .padding(.top, 20)
                }
                Section{
//                VStack(alignment: .leading, spacing: 0){
                    
//                    Text("Daily coffee intake")
//                        .font(.headline)
//                        .padding(.top, 20)
                    
//                    Stepper( coffeeAmount == 1 ? "1 cup" :  "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
//                        .padding(.top, 20)
//                    Stepper( "^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
//                        .padding(.top, 20)
                    
                    Picker("Daily coffee intake", selection: $coffeeAmount){
                        ForEach(1..<21){
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                }
            }
            .navigationTitle("BetterRest")
            .toolbar{
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
        
    }
    
    func calculateBedtime() {
        //Variaable especial para el picker
        let newCofeeAmount = coffeeAmount + 1
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
//            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(newCofeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        }catch{
            alertTitle = "Error"
            alertMessage = "Sorry, ther was a problem calculating your bedtime."
        }
        print(coffeeAmount)
        print(newCofeeAmount)
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
