//
//  TiebreakerView.swift
//  RockPaperScissors
//
//  Created by McKenzie, Cameron - Student on 10/15/25.
//
import SwiftUI

struct TieBreakerView: View {
    @Binding var playerScore: Int
    @Binding var cpuScore: Int
    @Environment(\.dismiss) var dismiss
    
    let choices = ["rock", "paper", "scissors"]
    
    @State private var result = "🔥 SUDDEN DEATH 🔥"
    @State private var showResult = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .black]),
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("TIEBREAKER")
                    .font(.system(size: 48, weight: .heavy))
                    .foregroundColor(.white)
                
                Text(result)
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 60) {
                    ForEach(choices, id: \.self) { choice in
                        Button(action: { playerChose(choice) }) {
                            Image(choice)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                                .background(Color.white.opacity(0.15))
                                .cornerRadius(20)
                        }
                    }
                }
                
                if showResult {
                    Button("Return") {
                        dismiss()                     }
                    .padding()
                    .font(.title3.bold())
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.red)
                    .shadow(radius: 5)
                }
            }
        }
    }
    
    func playerChose(_ choice: String) {
        let cpuChoice = choices.randomElement()!
        
        let win = (choice == "rock" && cpuChoice == "scissors") ||
        (choice == "paper" && cpuChoice == "rock") ||
        (choice == "scissors" && cpuChoice == "paper")
        
        let lose = (cpuChoice == "rock" && choice == "scissors") ||
        (cpuChoice == "paper" && choice == "rock") ||
        (cpuChoice == "scissors" && choice == "paper")
        
        if win {
            playerScore += 1
            result = "You WON 🏆"
        } else if lose {
            cpuScore += 1    
            result = "CPU wins ❌"
        } else {
            result = "Tied Again! 🤷‍♀️"
            return
        }
        
        showResult = true
    }
}

