//
//  AstronautView.swift
//  Moonshot
//
//  Created by Apple on 06/08/2024.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Rectangle())
                    .clipShape(.capsule)
                    .overlay(
                        Capsule()
                            .strokeBorder(.white, lineWidth: 1)
                    )
                    .padding()
                Text(astronaut.description)
                    .foregroundStyle(.white.opacity(0.6))
                    .font(.title3.bold())
                    .padding(.horizontal)
            }
        }
        .background(.darkBackGround)
        .navigationTitle(astronaut.name)
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["aldrin"]!)
}
