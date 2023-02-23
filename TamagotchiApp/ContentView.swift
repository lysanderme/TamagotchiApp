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
            VStack(alignment: .leading, spacing: 20) {
                Text(tamagotchi.getName()).font(.title)
                if tamagotchi.dead == true {
                    Text("\(tamagotchi.displayStats())").font(.title)
                } else {
                    Text("\(tamagotchi.displayStats())")
                }
            }
            if tamagotchi.dead {
            } else {
                Section {
                    Button("Sleep", action: {
                        tamagotchi.sleep()
                    })
                    Section {
                        Button("Feed \(tamagotchi.getName()) Snack", action: {
                            tamagotchi.eatSnack()
                        })
                        Section {
                            Button("Feed \(tamagotchi.getName()) a Meal", action: {
                                tamagotchi.eatMeal()
                            })
                            Section {
                                Button("Make \(tamagotchi.getName()) do Exercise", action: {
                                    tamagotchi.exercise()
                                })
                            }
                        }
                    }
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
