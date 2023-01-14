//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Myrddin-Evans, Lysander (JD) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tamagotchi = Tamagotchi(name: "Dave")
    
    var body: some View {
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text(tamagotchi.getName()).font(.title)
                Text("\(tamagotchi.displayStats())")
            }
            Section {
                Button("Sleep", action: {
                    tamagotchi.sleep()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
