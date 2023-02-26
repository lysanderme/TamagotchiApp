//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Myrddin-Evans, Lysander (JD) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi(name: "Dave")
    
    var body: some View {
        Form {
            if tamagotchi.dead {
                Text("\(tamagotchi.displayStats())").font(.title)
            } else {
                VStack(alignment: .leading, spacing: 20) {
                    Text(tamagotchi.getName()).font(.title)
                    Text("\(tamagotchi.displayStats())")
                }
                Section {
                    Button("Make \(tamagotchi.getName()) Sleep", action: {
                        tamagotchi.sleep()
                    })
                    Button("Feed \(tamagotchi.getName()) a Snack", action: {
                        tamagotchi.eatSnack()
                    })
                    Button("Feed \(tamagotchi.getName()) a Meal", action: {
                        tamagotchi.eatMeal()
                    })
                    Button("Play a Game with \(tamagotchi.getName())", action: {
                        tamagotchi.playGame()
                    })
                    Button("Make \(tamagotchi.getName()) Exercise", action: {
                        tamagotchi.exercise()
                    })
                    Button("Give \(tamagotchi.getName()) some Medicine", action: {
                        tamagotchi.takeMedicine()
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
