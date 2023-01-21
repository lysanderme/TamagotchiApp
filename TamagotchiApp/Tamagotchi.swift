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
    @Published var years: Int
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
            Sick: \(sick)
            """
    }
    
    func getName() -> String {
        return self.name
    }
    
    func sleep() {
        self.tiredness = 0
    }
    
    func eatSnack() {
        if self.hunger <= 1 {
            self.hunger = 0
        } else {
            self.hunger -= 1
        }
        self.happy += 1
        if self.weight >= 10 {
            getSick()
        } else {
            self.weight += 1
        }
        self.tiredness += 1
    }
    
    func eatMeal() {
        if self.hunger <= 2 {
            self.hunger = 0
        } else {
            self.hunger -= 2
        }
        self.happy += 1
        if self.weight >= 10 {
            getSick()
        } else {
            self.weight += 3
        }
        self.tiredness += 2
    }
    
    func getSick() {
        self.sick = true
        self.weight -= 6
        self.tiredness += 7
        self.happy = 0
    }
    
    
}
