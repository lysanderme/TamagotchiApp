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
                    Section {
                        Button("Feed \(tamagotchi.getName()) a Snack", action: {
                            tamagotchi.eatSnack()
                        })
                        Section {
                            Button("Feed \(tamagotchi.getName()) a Meal", action: {
                                tamagotchi.eatMeal()
                            })
                            Section {
                                Button("Make \(tamagotchi.getName()) Exercise", action: {
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
