//
//  ContentView.swift
//  Moonshot
//
//  Created by Apple on 02/08/2024.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct ContentView: View {
    
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        Text(String(astronaut.count))
    }
}

#Preview {
    ContentView()
}
