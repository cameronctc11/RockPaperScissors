//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by McKenzie, Cameron - Student on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var showingTieBreaker = false
    
    let choices = ["rock", "paper", "scissors"]
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Rock Paper Scissors")
                    .font(.largeTitle.bold())
                    .padding(.top)
                
                VStack(spacing: 8) {
                    Text("Player: \(playerScore)")
                    Text("CPU: \(cpuScore)")
                }
                .font(.title.bold())
                .padding()
                
                Spacer()
                
                HStack(spacing: 60) {
                    ForEach(choices, id: \.self) { choice in
                        Button(action: { playRound(choice) }) {
                            Image(choice)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(20)
            }
        }
    }
                
                Spacer()
                
                Button("Reset Scores") {
                    playerScore = 0
                    cpuScore = 0
                }
                .font(.title3.bold())
                .padding()
                .background(Color.red.opacity(0.9))
                .cornerRadius(15)
                .foregroundColor(.white)
                .padding(.bottom, 30)
            }
         
            .sheet(isPresented: $showingTieBreaker) {
                TieBreakerView(
                    playerScore: $playerScore,
                    cpuScore: $cpuScore)}
        }
    }
    
    func playRound(_ choice: String) {
        let cpuChoice = choices.randomElement()!
        
        let win = (choice == "rock" && cpuChoice == "scissors") ||
        (choice == "paper" && cpuChoice == "rock") ||
        (choice == "scissors" && cpuChoice == "paper")
        
        let lose = (cpuChoice == "rock" && choice == "scissors") ||
        (cpuChoice == "paper" && choice == "rock") ||
        (cpuChoice == "scissors" && choice == "paper")
        
        if win {
            playerScore += 1
        } else if lose {
            cpuScore += 1
        } else {
            showingTieBreaker = true
        }
    }
}


#Preview {
    ContentView()
}
