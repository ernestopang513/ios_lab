//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ernesto Pang on 09/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia","France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
//    init(){
//        print(correctAnswer)
//    }
    
    var body: some View {
        ZStack{
            
            RadialGradient(stops: [.init(color: .orange, location: 0.3),
                                   .init(color: .cyan, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            //            LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
            //                .ignoresSafeArea()
            
            
            //            Color.blue.ignoresSafeArea()
            
            VStack{
                Text("Guess the Flag").foregroundStyle(.white)
                    .font(.system(size: 30, weight: .heavy))
                
                VStack (spacing: 30) {
                    VStack {
                        Text("Tap the flag of").foregroundStyle(.black)
                        //                        .font(.subheadline.weight(.heavy))
                            .font(.system(size: 20, weight: .heavy))
                        Text(countries[correctAnswer]).foregroundStyle(.black)
                        //                        .font(.subheadline.weight(.semibold))
                            .font(.system(size: 20, weight: .none))
                    }
                    ForEach(0..<3){ number in
                        Button {
                            flagTapped(number)
                        } label : {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                            ////                        Text("Hola")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 25)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 40))
                
                Text("Score: ??")
                    .foregroundStyle(.white)
                    .font(.system(size: 30, weight: .semibold))
            }
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuiestion)
        } message: {
            Text("Your score is ???")
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuiestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

#Preview {
    ContentView()
}
