//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Myrddin-Evans, Lysander (JD) on 14/01/2023.
//

import Foundation

class Tamagotchi {
    let name: String
    var hunger: Int
    var happy: Int
    var weight: Int
    var years: Int
    var tiredness: Int
    
    init(name: String) {
        self.hunger = 5
        self.happy = 0
        self.weight = 1
        self.years = 1
        self.name = name
        self.tiredness = 0
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
}
