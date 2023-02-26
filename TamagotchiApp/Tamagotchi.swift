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
    @Published var tiredness: Int
    @Published var sick: Bool
    @Published var sicknessIgnored: Int
    @Published var dead: Bool
    @Published var wrongfulMedicine: Bool
    

    
    init(name: String) {
        self.hunger = 5
        self.happy = 0
        self.weight = 1
        self.name = name
        self.tiredness = 5
        self.sick = false
        self.sicknessIgnored = 0
        self.dead = false
        self.wrongfulMedicine = false
    }
    
    func displayStats() -> String {
        if dead {
            var cause: String = ""
            if self.sicknessIgnored >= 5 {
                if self.wrongfulMedicine {
                    cause = "wrongfully taken medicine"
                } else {
                    cause = "obesity"
                }
            } else if self.tiredness >= 15 {
                cause = "exhaustion"
            } else if self.hunger >= 10 {
                cause = "starvation"
            }
            return  """
                    Oh No!
                    \(self.name) died of \(cause)
                    """
        } else if self.weight > 10 {
            getSick()
            return """
                Hunger: \(hunger)
                Happiness: \(happy)
                Weight: \(weight)
                Tiredness: \(tiredness)
                Sick: Yes
                """
        } else if self.sick == true {
            return """
                Hunger: \(hunger)
                Happiness: \(happy)
                Weight: \(weight)
                Tiredness: \(tiredness)
                Sick: Yes
                """
        } else {
            
            return """
                Hunger: \(hunger)
                Happiness: \(happy)
                Weight: \(weight)
                Tiredness: \(tiredness)
                Sick: No
                """
        }
    }
    
    func getName() -> String {
        return self.name
    }
    
    func sleep() {
        self.tiredness = 0
        self.hunger += 3
    }
    
    func eatSnack() {
        if sick {
            self.sicknessIgnored += 1
            if self.sicknessIgnored >= 5 {
                die()
            }
        }
        if tiredness >= 15 {
            die()
        }
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
        if sick {
            self.sicknessIgnored += 1
            if self.sicknessIgnored >= 5 {
                die()
            }
        }
        if tiredness >= 15 {
            die()
        }
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
        self.tiredness += 4
        self.happy = 0
    }
    
    func die() {
        self.dead = true
    }
    
    func exercise() {
        if self.weight <= 1 {
            self.weight += 6
            getSick()
        } else {
            self.weight -= 1
        }
        self.tiredness += 1
        if self.tiredness >= 15 {
            die()
        }
        self.hunger += 1
        if self.hunger >= 10 {
            die()
        }
    }
    
    func playGame() {
        if self.happy < 10 {
            self.happy += 1
        }
    }
    
    func takeMedicine() {
        if self.sick == true && !wrongfulMedicine {
            self.sick.toggle()
            self.sicknessIgnored = 0
        } else {
            self.sick = true
            self.wrongfulMedicine = true
        }
    }
}
