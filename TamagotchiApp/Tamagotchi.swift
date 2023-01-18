//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Myrddin-Evans, Lysander (JD) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
    let name: String
    @Published var hunger: Int
    @Published var happy: Int
    @Published var weight: Int
    var years: Int
    @Published var tiredness: Int
    @Published var sick: Bool
    
    init(name: String) {
        self.hunger = 5
        self.happy = 0
        self.weight = 1
        self.years = 1
        self.name = name
        self.tiredness = 5
        self.sick = false
    }
    
    func displayStats() -> String {
        return """
            Hunger: \(hunger)
            Happiness: \(happy)
            Weight: \(weight)
            Age: \(years)
            Tiredness: \(tiredness)
            """
    }
    
    func getName() -> String {
        return self.name
    }
    
    func sleep() {
        self.tiredness = 0
    }
    
    func eatSnack() {
        self.hunger -= 1
        self.happy += 1
        self.weight += 1
        self.tiredness += 1
    }
    
    
}
